import importlib.util
import pathlib
import unittest

SPEC = importlib.util.spec_from_file_location("factor_generated_tests", pathlib.Path(__file__).with_name("factor-generated-tests.py"))
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class FactorGeneratedTests(unittest.TestCase):
    def test_preserves_every_constructor_and_assertion(self):
        source = '''    @Test func example() throws {
        let expectedResponse = AccountFees(
            achDispute: AccountFee(name: "literal (with parentheses)", percentage: Nullable<Double>.value(2.9)),
            paymentMethods: ["card": AccountFee(name: "escaped \\\"quote\\\"", percentage: Nullable<Double>.value(3))]
        )
        try #require(response == expectedResponse)
    }
'''
        result, count = MODULE.factor_text(source)
        self.assertEqual(count, 2)
        self.assertIn('let expectedAccountFee1 = AccountFee(name: "literal (with parentheses)"', result)
        self.assertIn('paymentMethods: ["card": expectedAccountFee2]', result)
        self.assertIn('try #require(response == expectedResponse)', result)
        self.assertEqual(result.count('AccountFee('), source.count('AccountFee('))

    def test_is_idempotent(self):
        source = '        let expectedResponse = AccountFees(achDispute: AccountFee(name: "fee"))'
        result, count = MODULE.factor_text(source)
        self.assertEqual(count, 1)
        self.assertEqual(MODULE.factor_text(result), (result, 0))

    def test_rejects_nested_account_fee_constructors(self):
        with self.assertRaises(ValueError):
            MODULE.factor_text('let expectedResponse = AccountFees(fee: AccountFee(child: AccountFee()))')

    def test_rejects_unbalanced_expected_constructors(self):
        with self.assertRaises(ValueError):
            MODULE.factor_text('let expectedResponse = AccountFees(fee: AccountFee(')

    def test_keeps_raw_json_and_unrelated_models(self):
        source = 'let fixture = #"""{"fee":"value"}"""#.utf8\nlet expectedResponse = OtherModel(fee: AccountFee())'
        self.assertEqual(MODULE.factor_text(source), (source, 0))

    def test_rejects_colliding_helper_names(self):
        with self.assertRaises(ValueError):
            MODULE.factor_text('let expectedResponse = AccountFees(fee: AccountFee(), other: expectedAccountFee1)')


if __name__ == "__main__":
    unittest.main()

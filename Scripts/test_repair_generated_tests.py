import importlib.util
import pathlib
import unittest

path = pathlib.Path(__file__).with_name("repair-generated-tests.py")
spec = importlib.util.spec_from_file_location("repair_generated_tests", path)
repair = importlib.util.module_from_spec(spec)
spec.loader.exec_module(repair)


class RepairGeneratedTests(unittest.TestCase):
    def fixture(self, business="null", individual="null"):
        return '''@Test func sample() {
        let body = Foundation.Data(#"""{"verification":{"business":''' + business + ',"individual":' + individual + '''}}"""#.utf8)
        let expected = Account(verification: [
            "business": JSONValue.value,
            "individual": JSONValue.value
        ])
        #expect(body != nil)
        }
        '''

    def test_repairs_only_proven_null_values(self):
        original = self.fixture()
        result, count = repair.repair_text(original)
        self.assertEqual(count, 2)
        self.assertEqual(result, original.replace("JSONValue.value", "JSONValue.null"))
        self.assertEqual(repair.RAW_JSON.findall(result), repair.RAW_JSON.findall(original))

    def test_is_idempotent(self):
        result, _ = repair.repair_text(self.fixture())
        repeated, count = repair.repair_text(result)
        self.assertEqual(repeated, result)
        self.assertEqual(count, 0)

    def test_rejects_a_non_null_fixture(self):
        with self.assertRaisesRegex(ValueError, "Cannot prove"):
            repair.repair_text(self.fixture(business='{"status":"approved"}'))

    def test_rejects_a_missing_raw_fixture(self):
        with self.assertRaisesRegex(ValueError, "Cannot prove"):
            repair.repair_text('verification: ["business": JSONValue.value, "individual": JSONValue.value]')

    def test_rejects_unrecognized_invalid_references(self):
        with self.assertRaisesRegex(ValueError, "Unexpected JSONValue.value"):
            repair.repair_text('let unrelated = JSONValue.value')

    def test_preserves_valid_expected_values(self):
        original = 'let value = JSONValue.string("value")'
        result, count = repair.repair_text(original)
        self.assertEqual(result, original)
        self.assertEqual(count, 0)


    def test_repairs_optional_self_case_with_source_and_fixture_proof(self):
        original = '@Test func sample() { let body = #"""{"fee_paid_by":"self"}"""#.utf8; let expected = Payout(feePaidBy: Optional(FeePaidBy.self)) }'
        result, count = repair.repair_text(original, {"FeePaidBy"})
        self.assertEqual(count, 1)
        self.assertEqual(result, original.replace("Optional(FeePaidBy.self)", "Optional(FeePaidBy.`self`)"))
        self.assertEqual(repair.repair_text(result, {"FeePaidBy"}), (result, 0))

    def test_rejects_optional_self_with_non_self_fixture(self):
        original = '@Test func sample() { let body = #"""{"fee_paid_by":"platform"}"""#.utf8; let expected = Payout(feePaidBy: Optional(FeePaidBy.self)) }'
        with self.assertRaisesRegex(ValueError, "Cannot prove"):
            repair.repair_text(original, {"FeePaidBy"})

    def test_rejects_optional_self_without_a_fixture(self):
        with self.assertRaisesRegex(ValueError, "Cannot prove"):
            repair.repair_text('Payout(feePaidBy: Optional(FeePaidBy.self))', {"FeePaidBy"})

    def test_preserves_legitimate_enum_metatypes(self):
        original = 'let value = try decoder.decode(FeePaidBy.self, from: data)'
        self.assertEqual(repair.repair_text(original, {"FeePaidBy"}), (original, 0))

    def test_requires_source_proof_of_the_self_enum_case(self):
        original = '@Test func sample() { let body = #"""{"fee_paid_by":"self"}"""#.utf8; let value = Payout(feePaidBy: Optional(FeePaidBy.self)) }'
        self.assertEqual(repair.repair_text(original), (original, 0))


if __name__ == "__main__":
    unittest.main()

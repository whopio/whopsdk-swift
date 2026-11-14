import pathlib
import re

EXPECTED = re.compile(r"(?m)^(?P<indent>[ \t]*)let expectedResponse = AccountFees\(")
ACCOUNT_FEE = re.compile(r"\bAccountFee\(")
RAW_JSON = re.compile(r'#"""(.*?)"""#\.utf8', re.DOTALL)


def closing_parenthesis(text, opening):
    depth = 0
    quoted = False
    escaped = False
    for offset in range(opening, len(text)):
        character = text[offset]
        if quoted:
            if escaped:
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == '"':
                quoted = False
        elif character == '"':
            if text.startswith('"""', offset):
                raise ValueError("Unexpected multiline string in an expected constructor")
            quoted = True
        elif character == "(":
            depth += 1
        elif character == ")":
            depth -= 1
            if depth == 0:
                return offset
    raise ValueError("Unbalanced expected constructor")


def factor_text(text):
    edits = []
    total = 0
    for match in EXPECTED.finditer(text):
        opening = match.end() - 1
        end = closing_parenthesis(text, opening) + 1
        original = text[match.start():end]
        constructors = []
        for constructor in ACCOUNT_FEE.finditer(original):
            if constructors and constructor.start() < constructors[-1][1]:
                raise ValueError("Nested AccountFee constructors require a reviewed factoring strategy")
            finish = closing_parenthesis(original, constructor.end() - 1) + 1
            constructors.append((constructor.start(), finish))
        if not constructors:
            continue
        if re.search(r"\bexpectedAccountFee\d+\b", original):
            raise ValueError("Expected constructor already references generated helper names")
        factored = original
        expressions = []
        for index, (start, finish) in reversed(list(enumerate(constructors, 1))):
            name = f"expectedAccountFee{index}"
            expression = original[start:finish]
            expressions.append((name, expression))
            factored = factored[:start] + name + factored[finish:]
        reconstructed = factored
        for name, expression in expressions:
            reconstructed, count = re.subn(r"\b" + name + r"\b", lambda _: expression, reconstructed)
            if count != 1:
                raise ValueError("A factored value does not appear exactly once")
        if reconstructed != original:
            raise ValueError("Factoring changed the expected response expression")
        declarations = "".join(
            f"{match['indent']}let {name} = {expression}\n"
            for name, expression in reversed(expressions)
        )
        replacement = "\n".join(line.rstrip() for line in (declarations + factored).split("\n"))
        edits.append((match.start(), end, replacement))
        total += len(constructors)
    result = text
    for start, end, replacement in reversed(edits):
        result = result[:start] + replacement + result[end:]
    if RAW_JSON.findall(result) != RAW_JSON.findall(text):
        raise ValueError("Factoring changed a raw response fixture")
    if len(re.findall(r"(?m)^[ \t]*@Test\b", result)) != len(re.findall(r"(?m)^[ \t]*@Test\b", text)):
        raise ValueError("Factoring changed the test inventory")
    return result, total


def main():
    path = pathlib.Path(__file__).resolve().parents[1] / "Tests/Wire/Resources/Accounts/Fees/FeesClientWireTests.swift"
    text = path.read_text()
    result, count = factor_text(text)
    if result != text:
        path.write_text(result)
    print(f"Factored {count} AccountFee expressions; every expected value, raw fixture and assertion is retained.")


if __name__ == "__main__":
    main()

import json
import pathlib
import re

PAIR = re.compile(
    r'(?P<start>\bverification:\s*\[\s*"business":\s*)JSONValue\.value'
    r'(?P<middle>\s*,\s*"individual":\s*)JSONValue\.value(?P<end>\s*\])'
)
RAW_JSON = re.compile(r'#"""(.*?)"""#\.utf8', re.DOTALL)


def verification_values(value):
    found = []
    if isinstance(value, dict):
        verification = value.get("verification")
        if isinstance(verification, dict) and {"business", "individual"} <= verification.keys():
            found.append((verification["business"], verification["individual"]))
        for child in value.values():
            found.extend(verification_values(child))
    elif isinstance(value, list):
        for child in value:
            found.extend(verification_values(child))
    return found


def repair_text(text):
    chunks = re.split(r"(?m)(?=^[ \t]*@Test\b)", text)
    repaired = []
    replacements = 0
    for chunk in chunks:
        matches = list(PAIR.finditer(chunk))
        if matches:
            fixtures = [json.loads(raw) for raw in RAW_JSON.findall(chunk)]
            evidence = [pair for fixture in fixtures for pair in verification_values(fixture)]
            if len(evidence) < len(matches) or any(pair != (None, None) for pair in evidence):
                raise ValueError("Cannot prove the invalid verification examples correspond to JSON null")
            chunk, count = PAIR.subn(
                lambda match: match["start"] + "JSONValue.null" + match["middle"] + "JSONValue.null" + match["end"],
                chunk,
            )
            replacements += count * 2
        if re.search(r"\bJSONValue\.value\b", chunk):
            raise ValueError("Unexpected JSONValue.value outside a proven null verification example")
        repaired.append(chunk)
    result = "".join(repaired)
    if RAW_JSON.findall(result) != RAW_JSON.findall(text):
        raise ValueError("The repair changed a raw response fixture")
    if len(re.findall(r"(?m)^[ \t]*@Test\b", result)) != len(re.findall(r"(?m)^[ \t]*@Test\b", text)):
        raise ValueError("The repair changed test inventory")
    return result, replacements


def main():
    root = pathlib.Path(__file__).resolve().parents[1] / "Tests/Wire"
    replacements = 0
    for path in sorted(root.rglob("*.swift")):
        text = path.read_text()
        result, count = repair_text(text)
        if result != text:
            path.write_text(result)
        replacements += count
    print(f"Repaired {replacements} proven JSON-null examples; raw fixtures and test cases are unchanged.")


if __name__ == "__main__":
    main()

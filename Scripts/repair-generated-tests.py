import json
import pathlib
import re

PAIR = re.compile(
    r'(?P<start>\bverification:\s*\[\s*"business":\s*)JSONValue\.value'
    r'(?P<middle>\s*,\s*"individual":\s*)JSONValue\.value(?P<end>\s*\])'
)
OPTIONAL_SELF = re.compile(
    r"(?P<prefix>\b(?P<field>[a-z][A-Za-z0-9]*):\s*Optional\()"
    r"(?P<enum>[A-Za-z_][A-Za-z0-9_]*)\.self(?P<suffix>\))"
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


def field_values(value, key):
    if isinstance(value, dict):
        return ([value[key]] if key in value else []) + [
            found for child in value.values() for found in field_values(child, key)
        ]
    if isinstance(value, list):
        return [found for child in value for found in field_values(child, key)]
    return []


def repair_text(text, self_case_enums=()):
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
        optional_cases = [match for match in OPTIONAL_SELF.finditer(chunk) if match["enum"] in self_case_enums]
        if optional_cases:
            fixtures = [json.loads(raw) for raw in RAW_JSON.findall(chunk)]
            for match in optional_cases:
                key = re.sub(r"[A-Z]", lambda letter: "_" + letter[0].lower(), match["field"])
                values = [value for fixture in fixtures for value in field_values(fixture, key)]
                if not values or any(value != "self" for value in values):
                    raise ValueError("Cannot prove the optional self enum case matches the JSON fixture")
            for match in reversed(optional_cases):
                chunk = chunk[:match.start()] + match["prefix"] + match["enum"] + ".`self`" + match["suffix"] + chunk[match.end():]
            replacements += len(optional_cases)
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
    self_case_enums = set()
    for source in sorted((root.parents[1] / "Sources").rglob("*.swift")):
        content = source.read_text()
        if re.search(r"(?m)^\s*case `self`(?:\s|$)", content):
            enum = re.search(r"public enum ([A-Za-z_][A-Za-z0-9_]*)", content)
            if enum:
                self_case_enums.add(enum[1])
    replacements = 0
    for path in sorted(root.rglob("*.swift")):
        text = path.read_text()
        result, count = repair_text(text, self_case_enums)
        if result != text:
            path.write_text(result)
        replacements += count
    print(f"Repaired {replacements} fixture-proven generated values; raw fixtures and test cases are unchanged.")


if __name__ == "__main__":
    main()

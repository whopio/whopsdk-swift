import json
import pathlib
import re

root = pathlib.Path(__file__).resolve().parents[1]
expected = json.loads((root / "Scripts/query-inputs.json").read_text())
actual = []
for path in sorted((root / "Sources/Resources").rglob("*.swift")):
    signature = ""
    for line in path.read_text().splitlines():
        if "public func " in line:
            signature = line
        match = re.search(r'"([^"]+)": (\w+)\.map \{ \.unknown\(\$0\) \}', line)
        if not match:
            continue
        field, variable = match.groups()
        parameter_type = re.search(r"\b" + variable + r": ([^,=]+)", signature)
        if parameter_type is None:
            raise SystemExit(f"Cannot identify query type: {path}:{field}")
        actual.append({
            "path": str(path.relative_to(root)),
            "field": field,
            "type": parameter_type[1].strip().rstrip("?").strip(),
        })
if actual != expected:
    raise SystemExit("Generated query inputs changed. Review the new wire types and update query-inputs.json and the wire fixtures before accepting regeneration.")
coverage = "\n".join(path.read_text() for path in (root / "Tests/Core").glob("*Tests.swift"))
for entry in actual:
    type_name = entry["type"].strip("[]")
    if not re.search(r"\b" + re.escape(type_name) + r"\b", coverage):
        raise SystemExit(f"No wire fixture covers {entry['path']}:{entry['field']} ({type_name})")
print(f"Verified all {len(actual)} generated structured query inputs have reviewed wire fixtures.")

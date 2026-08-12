#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

python3 - <<'PY'
import pathlib
import sys

import yaml

root = pathlib.Path(".")
errors = []

# Cada namespace mínimo (architecture/logical/planos.md) debe tener su manifiesto
# con Pod Security Standards "restricted" aplicado.
expected_namespaces = {
    "argos-xdr", "argos-cti", "argos-ai", "argos-policy", "argos-mcp",
    "argos-soar", "argos-smartops", "argos-observability", "argos-evidence",
    "argos-cyber-range",
}
ns_dir = root / "kubernetes/namespaces"
found = set()
if ns_dir.exists():
    for path in ns_dir.glob("*.yaml"):
        for doc in yaml.safe_load_all(path.read_text(encoding="utf-8")):
            if not doc or doc.get("kind") != "Namespace":
                continue
            name = doc.get("metadata", {}).get("name")
            labels = doc.get("metadata", {}).get("labels", {})
            found.add(name)
            if labels.get("pod-security.kubernetes.io/enforce") != "restricted":
                errors.append(f"{path}: namespace {name} sin Pod Security Standard 'restricted'")

missing = expected_namespaces - found
if missing:
    errors.append(f"Namespaces mínimos sin manifiesto: {sorted(missing)}")

# Debe existir una NetworkPolicy default-deny reutilizable.
if not (root / "kubernetes/network-policies/default-deny.yaml").exists():
    errors.append("kubernetes/network-policies/default-deny.yaml no existe")

if errors:
    print("TEST FALLIDO:")
    for e in errors:
        print(f"  - {e}")
    sys.exit(1)

print("test OK")
PY

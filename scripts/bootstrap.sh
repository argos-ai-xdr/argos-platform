#!/usr/bin/env bash
set -euo pipefail

command -v python3 >/dev/null 2>&1 || { echo "python3 requerido" >&2; exit 1; }

python3 -m pip install --quiet --upgrade pip
python3 -m pip install --quiet pyyaml jsonschema pre-commit

if [ -d .git ]; then
  pre-commit install
fi

if ! command -v tofu >/dev/null 2>&1; then
  echo "aviso: 'tofu' (OpenTofu) no está instalado; make validate solo hará YAML/JSON" >&2
fi

echo "bootstrap OK"

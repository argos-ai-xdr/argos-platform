#!/usr/bin/env bash
# Reset reproducible del cyber-range: borra el namespace y lo reconstruye
# desde bootstrap.sh. Debe poder ejecutarse entre cada ejecución de escenario
# sin intervención manual (Definition of Done del paso 3, gate G0/G3).
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Reseteando argos-cyber-range..."
kubectl delete namespace argos-cyber-range --ignore-not-found --wait=true --timeout=120s

./bootstrap/bootstrap.sh

# TODO (ARG-003): re-desplegar aquí los targets de emulación desde
# ../targets/allowlist.yaml y confirmar que el estado post-reset coincide con
# el baseline hash esperado (ver ../validation/checklist.md).

echo "cyber-range reset OK"

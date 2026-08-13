#!/usr/bin/env bash
# Crea/reconstruye el cyber-range desde cero: namespace aislado, default-deny,
# allowlist y cuotas. Idempotente — puede ejecutarse repetidas veces (ARG-003).
set -euo pipefail
cd "$(dirname "$0")/../.."

kubectl apply -f kubernetes/namespaces/argos-cyber-range.yaml
kubectl apply -n argos-cyber-range -f kubernetes/network-policies/default-deny.yaml
kubectl apply -n argos-cyber-range -f kubernetes/quotas/default-quota.yaml

# TODO (ARG-003): aplicar aquí las CiliumNetworkPolicy generadas a partir de
# cyber-range/targets/allowlist.yaml (una por target/sinkhole aprobado) y los
# manifiestos de los targets de emulación (Kubernetes Deployments vulnerables
# de laboratorio, ver ADR-011 y AC05 — path validity, out-of-scope rate = 0).

echo "cyber-range bootstrap OK (namespace, default-deny y cuotas aplicados)"

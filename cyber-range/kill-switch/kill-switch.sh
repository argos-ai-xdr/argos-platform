#!/usr/bin/env bash
# Kill switch: corta inmediatamente todo egress no esencial y detiene las
# cargas de trabajo del cyber-range. Cualquier rol puede invocarlo ante una
# desviación (ver argos-control/governance/policies/segregation-of-duties.md
# — Security Observer puede operar el kill switch aunque no opere el agente).
#
# Uso: ./kill-switch.sh [--reason "texto"]
set -euo pipefail
NAMESPACE=argos-cyber-range
REASON="sin motivo registrado"
if [ "${1:-}" = "--reason" ]; then
  REASON="${2:-sin motivo registrado}"
fi

echo "KILL SWITCH: argos-cyber-range — motivo: ${REASON}"

# 1. Elimina toda NetworkPolicy salvo default-deny-all (revoca cualquier
#    excepción de allowlist activa).
#    "grep -v ... || true": bajo set -o pipefail, si NO hay ninguna
#    excepción activa (el estado normal: solo existe default-deny-all),
#    grep no encuentra coincidencias y sale con status 1 — eso abortaba
#    todo el script en set -e, ANTES de llegar al paso 2 (escalar a cero).
#    Un kill switch que no llega a su propio paso de contención en el caso
#    más común es el peor momento posible para fallar en silencio.
kubectl get networkpolicy -n "$NAMESPACE" -o name \
  | { grep -v "networkpolicy.networking.k8s.io/default-deny-all" || true; } \
  | xargs -r kubectl delete -n "$NAMESPACE"

# 2. Escala a cero todos los Deployments del namespace (scale-to-zero,
#    ver argos-control/architecture/data-flows/end-to-end-flow.md paso 8).
kubectl get deployment -n "$NAMESPACE" -o name \
  | xargs -r -I{} kubectl scale {} -n "$NAMESPACE" --replicas=0

echo "Kill switch aplicado. Para restaurar, usar ../reset/reset.sh (reset completo, no reanudación en caliente)."

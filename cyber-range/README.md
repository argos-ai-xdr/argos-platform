# cyber-range/

Implementa ARG-003 (cyber-range base, namespaces, default-deny, reset y kill switch) sobre el namespace `argos-cyber-range` (máximo aislamiento, ver `../kubernetes/namespaces/argos-cyber-range.yaml` y `argos-control/architecture/trust-zones/trust-zones.md`).

| Carpeta | Contenido |
| --- | --- |
| [`bootstrap/bootstrap.sh`](bootstrap/bootstrap.sh) | Crea el namespace, default-deny y cuotas desde cero |
| [`targets/allowlist.yaml`](targets/allowlist.yaml) | Allowlist cerrada — todo lo no listado produce DENY |
| [`reset/reset.sh`](reset/reset.sh) | Reset reproducible (borra y reconstruye) |
| [`kill-switch/kill-switch.sh`](kill-switch/kill-switch.sh) | Corta egress y escala a cero de inmediato |
| [`validation/checklist.md`](validation/checklist.md) | Checklist de validación, evidencia de entrada de G3 |

El agente (LangGraph/vLLM) nunca invoca estos scripts directamente: son operados por `cyber-range-engineer` o disparados desde `argos-cyber-tools` a través del ejecutor autorizado, nunca desde el LLM (ADR-003, ADR-011).

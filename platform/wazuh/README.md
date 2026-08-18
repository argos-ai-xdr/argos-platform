# Wazuh

* **Decisión**: ADR-010 (toolchain P0) — SIEM/XDR: ingesta, reglas, búsqueda y correlación, junto con OpenSearch.
* **Namespace**: `argos-xdr`.
* **Instalación**: fuera de `../../helm/argos-services/Chart.yaml` (Wazuh mantiene su propio chart oficial multi-componente: indexer, manager, dashboard — evaluar en ARG-015 si se reutiliza el OpenSearch de `../opensearch/` como indexer compartido o uno dedicado).

## Rol en el flujo

Productor de `SecurityEvent v1` (envelope OCSF-aligned, ADR-001) hacia `argos-core/services/normalizer`. Los agentes Wazuh se despliegan en `kube-system`/nodos (plano P1, ver `argos-control/architecture/logical/planos.md`).

## Sidecar de candidatos ARGOS (ADR-070, ARG-039)

Cuando exista, el único camino por el que ARGOS escribe hacia Wazuh es un **agente Wazuh real** (sidecar, grupo dedicado, módulos innecesarios desactivados) publicando `CandidateFinding` vía `localfile` al Wazuh Manager, `source_mode=CANDIDATE`. Descartados explícitamente (`DE-25`/`DE-26`, `ADR-070`):

* Escritura directa de ARGOS al Wazuh Indexer/OpenSearch (`DE-25=0`).
* Reimplementar el protocolo interno agent-manager en vez de usar un agente real.
* Que el sidecar tenga capacidad de desplegar reglas (`DE-26=0`) — el único camino de despliegue sigue siendo `WazuhRuleSpec → compilador → wazuh-logtest → backtest → SOC → RuleDeploymentGate → GitOps` (`ADR-069`), nunca el sidecar.

No implementado como componente real todavía — requiere un agente Wazuh real (`BLOCKED_EXTERNAL`).

## Pendiente (ARG-015)

* Fijar versión de Wazuh Manager/Agent e imagen firmada.
* Reglas activas iniciales (subconjunto mínimo para ARGOS-CYB-01, no el ruleset completo).
* Confirmar si el indexer de Wazuh reutiliza `../opensearch/` o es una instancia separada.
* Sidecar de candidatos ARGOS (ARG-039, ver arriba).

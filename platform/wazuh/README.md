# Wazuh

* **Decisión**: ADR-010 (toolchain P0) — SIEM/XDR: ingesta, reglas, búsqueda y correlación, junto con OpenSearch.
* **Namespace**: `argos-xdr`.
* **Instalación**: fuera de `../../helm/argos-services/Chart.yaml` (Wazuh mantiene su propio chart oficial multi-componente: indexer, manager, dashboard — evaluar en ARG-015 si se reutiliza el OpenSearch de `../opensearch/` como indexer compartido o uno dedicado).

## Rol en el flujo

Productor de `SecurityEvent v1` (envelope OCSF-aligned, ADR-001) hacia `argos-core/services/normalizer`. Los agentes Wazuh se despliegan en `kube-system`/nodos (plano P1, ver `argos-control/architecture/logical/planos.md`).

## Pendiente (ARG-015)

* Fijar versión de Wazuh Manager/Agent e imagen firmada.
* Reglas activas iniciales (subconjunto mínimo para ARGOS-CYB-01, no el ruleset completo).
* Confirmar si el indexer de Wazuh reutiliza `../opensearch/` o es una instancia separada.

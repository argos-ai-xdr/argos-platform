# OpenSearch

* **Decisión**: ADR-006 (`argos-control/adr/ADR-006-evidence-store.md`) — índice consultable de eventos, incidentes y decisiones. El almacenamiento de objetos va en Ceph RGW (`../ceph-rgw/`).
* **Admisión**: self-hosted; índices y mappings versionados.
* **Namespace**: `argos-evidence` (índices de evidencia) y `argos-xdr` (índices Wazuh/correlación) — dos usos, mismo motor, separar por índice/alias, no por instancia salvo que la capacidad de `osc` lo exija.
* **Instalación**: chart `opensearch-project/helm-charts` (declarado en `../../helm/argos-services/Chart.yaml`, `opensearch.enabled`).

## Pendiente

* Fijar versión/digest del chart y mappings v1 de `SecurityEvent`/`Incident` (ver `argos-contracts-scenarios` cuando exista).
* Política de retención por índice (AC14: trace completeness >= 0.95).
* Backup/restore probado (ver `../../tests/recovery/`, ARG-025).

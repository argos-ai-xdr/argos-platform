# MISP

* **Decisión**: ADR-007 (`argos-control/adr/ADR-007-cti-sources.md`) — núcleo P0 de CTI; IBM X-Force excluido del diseño.
* **Admisión**: fuente, licencia, fecha y hash de cada snapshot.
* **Namespace**: `argos-cti`.
* **Instalación**: fuera de `../../helm/argos-services/Chart.yaml` (proyecto MISP mantiene su propio chart/compose — evaluar en ARG-016).

## Rol en el flujo

Fuente de IoCs consumida por `argos-core/services/correlator` junto a snapshots versionados de ATT&CK, KEV, EPSS y CVE/NVD (`argos-contracts-scenarios/snapshots/`). Todo IoC usado debe tener fuente, snapshot, timestamp y `evidence_ref` (AC08 — grounding CTI, inventados = 0).

## Pendiente (ARG-016)

* Fijar versión de MISP y proceso de snapshot reproducible (sin depender de red durante la aceptación, ver AC01 y la regla de "reproducibilidad offline").
* OpenCTI Community queda como opción PI3, no P0 (ver `argos-control/compatibility/components.yaml`).

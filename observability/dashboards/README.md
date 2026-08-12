# Dashboards

Dashboards Grafana (JSON) provisionados en `../grafana/provisioning/dashboards/`. Ninguno todavía — corresponden a ARG-026 (evidence store, dashboards y paquete firmado, S7).

Dashboards previstos (no implementados):

* **Salud de plataforma**: pods, NetworkPolicy denies, cuotas.
* **Pipeline de eventos**: throughput `SecurityEvent` → `Incident` → `Recommendation`, correlacionado por `run_id`.
* **Gates de aceptación**: estado agregado de AC01-AC14 por run (fuente: `argos-validation`, no un exporter de este repositorio).

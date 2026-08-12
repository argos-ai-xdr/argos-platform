# observability/

Implementa ADR-009 (OpenTelemetry Collector, Prometheus/Grafana OSS, OpenSearch; correlación por `run_id`/`trace_id`; sin exportadores SaaS obligatorios; sin chain-of-thought en trazas).

| Carpeta | Contenido |
| --- | --- |
| [`otel-collector/config.yaml`](otel-collector/config.yaml) | Receivers OTLP, redacción de atributos sensibles, exporters a Prometheus/OpenSearch |
| [`prometheus/prometheus.yaml`](prometheus/prometheus.yaml) | Scrape config |
| [`grafana/`](grafana/) | Provisioning de datasources (Prometheus + OpenSearch) |
| [`dashboards/`](dashboards/) | Pendiente (ARG-026) |
| [`alerts/platform-health.yaml`](alerts/platform-health.yaml) | Reglas de alerta de salud de plataforma (no de AC01-AC14) |

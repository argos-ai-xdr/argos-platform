# NATS JetStream

* **Decisión**: ADR-002 (`argos-control/adr/ADR-002-nats-jetstream.md`) — bus MVP, at-least-once, durable consumers, retry, DLQ, deduplicación por `event_id`.
* **Admisión (compatibility/components.yaml)**: TLS, subjects por servicio y DLQ.
* **Namespace**: transversal — cada plano publica/consume en sus propios subjects (ver `argos-control/architecture/trust-zones/trust-zones.md`).
* **Instalación**: chart oficial `nats-io/k8s` (declarado como dependencia en `../../helm/argos-services/Chart.yaml`, `nats.enabled`).

## Pendiente (ARG-001/003)

* Fijar versión/digest del chart y de la imagen `nats:*`.
* Definir subjects por servicio (`security.event.v1.*`, `incident.v1.*`, ...) y política de retención por stream.
* Configurar TLS entre clientes y el clúster NATS (identidad de workload vía SPIRE, ver `../spire/`).

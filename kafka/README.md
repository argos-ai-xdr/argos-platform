# kafka/

Bus de eventos Kafka (ADR-069, `argos-control`) — **paralelo** a NATS JetStream (`ADR-002`), no lo sustituye. Exclusivo del plano de investigación global e ingeniería de reglas Wazuh: `SecurityEvent`/`Incident`/`Recommendation`/`Approval`/`ActionResult` siguen sobre NATS JetStream sin cambios.

**Desviación explícita de `ADR-002`** (que citaba "sin la complejidad operativa de un stack tipo Kafka" como razón para elegir NATS): documentada y justificada en `ADR-069`, no oculta — decisión del usuario, no una limitación técnica de NATS JetStream (que ya ofrece consumidores durables/retry/DLQ/dedup equivalentes).

| Archivo | Contenido |
| --- | --- |
| [`topics.yaml`](topics.yaml) | Los 8 topics declarados en ADR-069 §Decisión 1, con partition key preferente (`correlation_key`, subsidiaria `asset_id`/`incident_id`). |
| [`namespaces/argos-kafka.yaml`](namespaces/argos-kafka.yaml) | Namespace propio para el clúster Kafka — separado de `argos-xdr` (Wazuh) y `argos-ai` (Investigator). |
| [`rbac/producer-consumer-scope.yaml`](rbac/producer-consumer-scope.yaml) | RBAC mínimo: el productor Wazuh->Kafka solo puede escribir en `wazuh.*`; el Investigator solo puede leer, nunca escribir en topics de `wazuh.*`/`argos.rule.*`. |
| [`policies/network-deny-default.yaml`](policies/network-deny-default.yaml) | Deny-by-default, egress explícito solo a los namespaces productor/consumidor reales. |

## Pendiente (ARG-033)

* Chart/operador Kafka real sin fijar (Strimzi es el candidato natural para Kubernetes — TODO, no decidido aún).
* El productor `Wazuh archives.json/alerts.json -> Kafka` (ver `ADR-069`, "en paralelo, nunca sustituyendo" el flujo soportado `Wazuh Manager -> Filebeat -> Wazuh Indexer`) no existe todavía como componente real.
* Nada de esto se ha desplegado contra un clúster real — `BLOCKED_EXTERNAL`, mismo bloqueo que `chaos/` y el resto de `platform/*` sin clúster real disponible en este entorno.

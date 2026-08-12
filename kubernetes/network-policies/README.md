# NetworkPolicy — default-deny

`default-deny.yaml` se aplica en **todos** los namespaces (ver `argos-control/architecture/trust-zones/trust-zones.md`): ingress y egress denegados salvo excepción explícita.

## Cómo añadir una excepción

Cada conexión permitida de la tabla de zonas de confianza (`argos-control/architecture/trust-zones/trust-zones.md`) se traduce en una `NetworkPolicy` adicional, con nombre `allow-<origen>-to-<destino>.yaml`, en el overlay del servicio correspondiente (no aquí, que es la base común). Ejemplo de origen/destino ya decididos:

* `normalizer` → `NATS JetStream` (TLS, subjects allowlist)
* `LangGraph` → `MCP gateway/OPA/vLLM` (MCP + HTTPS, audience exacta)
* `Shuffle executor` → `Cilium/K8s cyber-range` (K8s API, `approval_id`/`plan_hash`)

No añadir una excepción sin poder señalar la fila correspondiente en la tabla de zonas de confianza o un ADR que la justifique.

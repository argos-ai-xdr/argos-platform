# helm/

| Chart | Contenido |
| --- | --- |
| [`argos-platform/`](argos-platform/) | Add-ons transversales al clúster (Gatekeeper, cert-manager, image policy controller) |
| [`argos-services/`](argos-services/) | Umbrella chart de los servicios de plataforma con estado (NATS, Keycloak, OpenSearch, ...) |

Ambos charts se promueven vía `../argocd/`, nunca con `helm install` manual contra `laboratory`/`osc`.

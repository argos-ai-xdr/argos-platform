# chaos/

Chaos Mesh (ADR-068, `argos-control`) — infraestructura real para experimentos de fault injection sobre `argos-cyber-range`. La decisión de autorización (¿se puede ejecutar este experimento?) vive en `argos-validation/chaos` (`ChaosSafetyGuard`), NO aquí — este directorio es solo el plano de infraestructura que ese gate debería preceder siempre.

| Carpeta | Contenido |
| --- | --- |
| [`helm/values.yaml`](helm/values.yaml) | Values del chart oficial de Chaos Mesh (`https://charts.chaos-mesh.org`) — versión sin fijar todavía (mismo patrón que `platform/wazuh`: chart oficial multi-componente, instalado por separado del chart paraguas `helm/argos-services`). |
| [`namespaces/argos-chaos-engine.yaml`](namespaces/argos-chaos-engine.yaml) | Namespace propio para el `chaos-controller-manager`/dashboard — nunca corre en `argos-cyber-range` (separa "quién inyecta el fallo" de "dónde se inyecta"). |
| [`rbac/chaos-target-scope.yaml`](rbac/chaos-target-scope.yaml) | `Role`+`RoleBinding` que limita lo que el `chaos-controller-manager` puede tocar a los recursos de `argos-cyber-range` — nunca cluster-wide. |
| [`policies/network-deny-default.yaml`](policies/network-deny-default.yaml) | `NetworkPolicy` deny-by-default para `argos-chaos-engine`, con egress explícito solo al API server y a `argos-cyber-range`. |
| [`safety-guards/README.md`](safety-guards/README.md) | Enlaza al gate real (`argos-validation/chaos.ChaosSafetyGuard`) — este directorio no duplica esa lógica, documenta cómo un orquestador real debería consultarla. |

## Pendiente (ARG-031)

* Fijar versión/digest real del chart de Chaos Mesh antes de `helm dependency update` (mismo patrón TODO que el resto de `platform/*`).
* Chaos Mesh no tiene un valor Helm nativo de "namespace objetivo único" — el scoping real depende de RBAC (`rbac/chaos-target-scope.yaml`) + el `selector.namespaces` de cada experimento; documentado aquí como limitación conocida, no resuelta con una casilla de configuración.
* Nada de esto se ha desplegado contra un clúster real todavía — `BLOCKED_EXTERNAL`, mismo bloqueo que el resto de `platform/*` sin clúster real disponible en este entorno.

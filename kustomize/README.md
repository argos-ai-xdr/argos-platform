# kustomize/

`base/` referencia los manifiestos de `../kubernetes/` y las políticas de `../policies/` comunes a todos los entornos. `overlays/{local,laboratory,demo}/` los adaptan por entorno; `demo` se apoya en `laboratory` para el escenario ARGOS-CYB-01 (S8).

Promoción vía `../argocd/application-sets/platform-baseline.yaml`, nunca `kubectl apply -k` manual contra `laboratory`.

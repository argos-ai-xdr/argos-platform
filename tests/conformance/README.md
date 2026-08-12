# conformance

Verifica que los manifiestos declarativos (`kubernetes/`, `helm/`, `kustomize/`) cumplen la baseline: Pod Security `restricted`, default-deny presente, cuotas definidas, labels obligatorias (`policies/namespace-baseline/`). Ejecutado hoy vía `scripts/test.sh`; ampliar aquí con `kubeconform`/`conftest` cuando estén disponibles localmente (ya corren en CI, `reusable-iac-ci.yaml`).

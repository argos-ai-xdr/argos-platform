# Desarrollo en argos-platform

## Requisitos

* `git`, `make`.
* `tofu` (OpenTofu) >= 1.7.
* `kubectl`, `kustomize`, `helm`.
* `argocd` CLI (opcional, para depuración).
* `python3` con `pyyaml` para las validaciones locales.

## Comandos

```bash
make bootstrap   # instala hooks de pre-commit y herramientas locales de validación
make validate    # valida YAML/JSON, repository.yaml, tofu fmt/validate
make test        # valida namespaces/policies contra kubeconform + conftest (ver scripts/test.sh)
```

## Cómo trabajar en un entorno

* `local`: `cd opentofu/environments/local && tofu init && tofu plan`. Libre de aplicar directamente para desarrollo individual.
* `laboratory`/`osc`: **no** se aplica manualmente. Se abre PR contra `kustomize/overlays/<entorno>/` o `helm/`; Argo CD sincroniza tras el merge.

## Antes de abrir un PR

1. `make validate` sin errores.
2. Si el cambio toca `policies/gatekeeper/`, `cyber-range/kill-switch/` o `cyber-range/reset/`, un `qa-security-observer` revisa el PR.
3. El PR enlaza una historia `ARG-###`.

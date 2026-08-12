terraform {
  required_version = ">= 1.7.0"
}

module "registry" {
  source      = "../../modules/registry"
  environment = "local"
}

module "dns_certs" {
  source      = "../../modules/dns-certs"
  environment = "local"
  base_domain = "argos.local"
}

# El clúster local (kind/k3d/minikube) se asume provisto fuera de OpenTofu por
# `../../../cyber-range/bootstrap/` o por el desarrollador; este entorno solo
# fija registry y DNS/certs equivalentes a laboratory/osc para que los charts
# de ../../../helm/ se comporten igual en todos los entornos.

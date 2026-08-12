terraform {
  required_version = ">= 1.7.0"
}

module "registry" {
  source      = "../../modules/registry"
  environment = "osc"
}

module "dns_certs" {
  source      = "../../modules/dns-certs"
  environment = "osc"
  base_domain = "argos.osc.example" # TODO (DEP-02): sustituir por el dominio real de OSC
}

# TODO (DEP-02): OSC, registry, DNS, certificados y namespaces — fecha límite
# semana 1 de S1. Fallback si no está listo: Kubernetes local equivalente y
# manifests portables (usar environments/laboratory/), la demo sigue local.

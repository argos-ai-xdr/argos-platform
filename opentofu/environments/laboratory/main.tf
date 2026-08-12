terraform {
  required_version = ">= 1.7.0"
}

module "registry" {
  source      = "../../modules/registry"
  environment = "laboratory"
}

module "dns_certs" {
  source      = "../../modules/dns-certs"
  environment = "laboratory"
  base_domain = "argos.laboratory.local"
}

# El namespace argos-cyber-range y su aislamiento (egress denegado salvo
# allowlist) se declaran en ../../../kubernetes/namespaces/argos-cyber-range.yaml
# y se resetean/verifican vía ../../../cyber-range/, no aquí.

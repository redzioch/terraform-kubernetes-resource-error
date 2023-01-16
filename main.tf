terraform {
  required_providers {

    # k8s
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.16.1"
    }

  }
}

provider "kubernetes" {
  config_path = "${path.module}/secrets/kube_config/kube_config.yml"
  insecure = true
}

data "kubernetes_resource" "address_pool_crd" {
  api_version = "apiextensions.k8s.io/v1"
  kind        = "CustomResourceDefinition"
  metadata {
    name      = "addresspools.metallb.io"
  }
}

output "address_pool_crd" {
  value = data.kubernetes_resource.address_pool_crd
}
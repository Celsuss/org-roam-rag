terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    # https://registry.terraform.io/providers/hashicorp/helm/latest/docs
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
    # https://github.com/PrefectHQ/terraform-provider-prefect/blob/main/docs/guides/getting-started.md
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "minikube"
  }
}

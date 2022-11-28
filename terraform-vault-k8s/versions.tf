terraform {
  required_version = ">= 1.0.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.9.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42"
    }
  }
}
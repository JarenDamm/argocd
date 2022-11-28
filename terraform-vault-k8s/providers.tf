data "azurerm_kubernetes_cluster" "teletraan" {
  depends_on          = [module.aks-cluster]
  name                = var.cluster_name
  resource_group_name = var.cluster_resource_group
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.teletraan.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.teletraan.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.teletraan.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.teletraan.kube_config.0.cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.teletraan.kube_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.teletraan.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.teletraan.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.teletraan.kube_config.0.cluster_ca_certificate)
}

provider "azurerm" {
  features {}
}

module "aks-cluster" {
  source       = "./aks-cluster"
  cluster_name = var.cluster_name
  location     = var.cluster_location
}

module "kubernetes-config" {
  depends_on   = [module.aks-cluster]
  source       = "./kubernetes-config"
  cluster_name = var.cluster_name
  kubeconfig   = data.azurerm_kubernetes_cluster.teletraan.kube_config_raw
}


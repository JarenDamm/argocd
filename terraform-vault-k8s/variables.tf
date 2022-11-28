variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "namespace" {
  type    = string
  default = "vault"
}

variable "VAULT_CONNECTION_STRING" {
  type      = string
  sensitive = true
}

variable "vault_replica_count" {
  type    = number
  default = 5
}

variable "cluster_name" {
  type = string
}

variable "cluster_resource_group" {
  type = string
}

variable "cluster_location" {
  type = string
}
resource "helm_release" "vault" {
  name             = "vault"
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "vault"
  namespace        = var.namespace
  version          = "0.22.1"
  create_namespace = true

  #   values = [
  #     file("vault-values.yaml")
  #   ]
  values = [
    templatefile("vault.tmpl", {
      vault_replica_count     = var.vault_replica_count
      vault_connection_string = var.VAULT_CONNECTION_STRING
    })
  ]

}

# resource "vault_auth_backend" "example" {
#   type = "userpass"
# }

# resource "vault_policy" "admin_policy" {
#   name   = "admins"
#   policy = file("policies/admin.hcl")
# }

# resource "vault_policy" "developer_policy" {
#   name   = "developers"
#   policy = file("policies/dev_policy.hcl")
# }

# resource "vault_policy" "operations_policy" {
#   name   = "operations"
#   policy = file("policies/operations.hcl")
# }

# resource "vault_mount" "developers" {
#   path        = "developers"
#   type        = "kv-v2"
#   description = "KV2 Secrets Engine for Developers."
# }

# resource "vault_mount" "operations" {
#   path        = "operations"
#   type        = "kv-v2"
#   description = "KV2 Secrets Engine for Operations."
# }

# resource "vault_generic_secret" "developer_sample_data" {
#   path = "${vault_mount.developers.path}/test_account"

#   data_json = <<EOT
# {
#   "username": "foo",
#   "password": "bar"
# }
# EOT
# }
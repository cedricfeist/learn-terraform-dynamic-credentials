provider "vault" {}

data "vault_kv_secrets_list_v2" "secrets" {
  mount = "example"
}

data "vault_kv_secret_v2" "creds" {
  #namespace = "admin"
  mount = "example"
  name = "unsecret"
}

output "data" {
  value = data.vault_kv_secret_v2.creds.data
}
output "data_json" {
  value = data.vault_kv_secret_v2.creds.data_json
}
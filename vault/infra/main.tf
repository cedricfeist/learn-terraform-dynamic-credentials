provider "vault" {}

data "vault_kv_secrets_list_v2" "secrets" {
  mount = "example"
}

data "vault_kv_secret_v2" "creds" {
  #namespace = "admin"
  mount = data.vault_kv_secrets_list_v2.mount
  name = data.vault_kv_secrets_list_v2.secrets
}

output "aws_cred_demo" {
  value = data.vault_kv_secret_v2.creds.name
}
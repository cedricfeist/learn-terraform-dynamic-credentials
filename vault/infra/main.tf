provider "vault" {}

resource "vault_mount" "example" {
  path    = "example"
  type    = "kv-v2"
  options = { version = "2" }
}

resource "vault_kv_secret_v2" "example" {
  mount = vault_mount.example.path

  name                = "unsecret"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      creds = "awscreds"
    }
  )
}

data "vault_kv_secret_v2" "creds" {
  namespace = "admin"
  mount = "example"
  name = "unsecret"

}

output "secret" {
  value = data.creds.name
}
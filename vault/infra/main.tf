provider "vault" {}

data "vault_kv_secrets_list_v2" "secrets" {
  mount = "example"
}

data "vault_kv_secret_v2" "example" {
  #namespace = "admin"
  mount = "example"
  name = "unsecret"
}

output "data" {
  value = data.vault_kv_secret_v2.example.data["creds"]
  sensitive = true
}

data "vault_kv_secret_v2" "creds" {
  mount = "example"
  name = "aws"
}

provider "aws" {
  region     = "eu-central-1"
  #access_key = data.vault_kv_secret_v2.creds.data["AWS_ACCESS_KEY"]
  #secret_key = data.vault_kv_secret_v2.creds.data["AWS_SECRET_ACCESS_KEY"]
  access_key = data.vault_aws_access_credentials.awsdynamic.access_key
  secret_key = data.vault_aws_access_credentials.awsdynamic.secret_key
}

resource "aws_instance" "instance" {
  instance_type = "t3.micro"
  ami = "ami-0110d1b5b1cdd8780"
  
}

data "vault_aws_access_credentials" "awsdynamic" {
  backend = "aws"
  role = "aws-role" 
}


provider "vault" {}

#data "vault_kv_secrets_list_v2" "secrets" {
#  mount = "example"
#}

#data "vault_kv_secret_v2" "creds" {
#  mount = "example"
#  name = "aws"
#}

data "vault_aws_access_credentials" "awsdynamic" {
  backend = "aws"
  role = "aws-role" 
  
}

provider "aws" {
  region     = "eu-central-1"
  #access_key = data.vault_kv_secret_v2.creds.data["AWS_ACCESS_KEY"]
  #secret_key = data.vault_kv_secret_v2.creds.data["AWS_SECRET_ACCESS_KEY"]
  access_key = data.vault_aws_access_credentials.awsdynamic.access_key
  secret_key = data.vault_aws_access_credentials.awsdynamic.secret_key
}

resource "aws_instance" "instance" {
  instance_type = "t2.micro"
  ami = "ami-0110d1b5b1cdd8780"
  count = 1
  tags = {
    Name = "instance_name"
  }
}




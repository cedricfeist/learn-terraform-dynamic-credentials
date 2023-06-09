variable "jwt_backend_path" {
  type        = string
  default     = "jwt_tf"
  description = "The path at which you'd like to mount the jwt auth backend in Vault"
}

variable "tfc_vault_audience" {
  type        = string
  default     = "vault.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with Vault"
}

variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
  default = "cedric"
}

variable "tfc_project_name" {
  type        = string
  default     = "AWS"
  description = "The project under which a workspace will be created"
}

variable "tfc_workspace_name" {
  type        = string
  default     = "vault-backed-workspace"
  description = "The name of the workspace that you'd like to create and connect to Vault"
}

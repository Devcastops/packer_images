variable "project_id" {
  type = string
  default = "devcastops"
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "VAULT_ADDR" {
  type    = string
  default = "vault.devcastops.com:8500"
}

variable "VAULT_TOKEN" {
  type    = string
  sensitive = true
}

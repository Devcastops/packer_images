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
  default = "https://vault.devcastops.com:8200"
}

variable "VAULT_TOKEN" {
  type    = string
  sensitive = true
}

variable "vault_binary_loc" {
  type    = string
  default = "/usr/local/bin"
}

variable "key_vault_id" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type    = string
  default = ""
}

variable "object_id" {
  type    = string
  default = ""
}

variable "secret_permissions" {
  default = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}



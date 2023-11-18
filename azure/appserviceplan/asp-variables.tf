variable "environment" {
  type        = string
  description = "(Required) Custom variable. This the enviorment name where the resouce group will be created."

  validation {
    condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "hub" || var.environment == "uat" || var.environment == "prod" || var.environment == "tst"
    error_message = " Invalid environment name. Should be one of these - dev,qa,hub,uat,prod,tst"
  }
}

variable "main_project" {
  type        = string
  description = "(Required) Custom variable. Main project name."
}

variable "sub_project" {
  type        = string
  description = "(Required) Custom variable. Sub project name."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
}

variable "resource_group_name" {
  description = "Indicates the name of the resouce group"
  default     = "default-resourcegroup"
}

variable "location" {
  description = "The Azure Region in which to create resource."
  default     = ""
}

variable "asp_sku_size" {
  description = "Sku size"
  default     = "S1"
}

variable "asp_os_type" {
  description = "OS of app service plan."
  default     = "Windows"
}

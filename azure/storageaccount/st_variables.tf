variable "environment" {
  type        = string
  description = "(Required) Custom variable. This the enviorment name where the resouce group will be created."

  validation {
    condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "hub" || var.environment == "uat" || var.environment == "prod" || var.environment == "tst"
    error_message = "Invalid environment name. Should be one of these - dev,qa,hub,uat,prod,tst."
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

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "account_tier" {
    description =  "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
    type = string
    default = "Standard"
}

variable "account_replication_type" {
    description =  "(Optional) A mapping of tags which should be assigned to the Resource Group."
    type = string
    default = "GRS"
}

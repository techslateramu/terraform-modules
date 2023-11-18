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

variable "app_service_plan_id" {
  description = "(Required) Specifies the name of the Function App. Changing this forces a new resource to be created. Limit the function name to 32 characters to avoid naming collisions. For more information about Function App naming rule"
  type = string
  default = ""
}

variable "storage_account_name" {
  type = string
  default = ""
}

variable "storage_account_access_key" {
  description = "(Required) Specifies the name of the Function App. Changing this forces a new resource to be created. Limit the function name to 32 characters to avoid naming collisions. For more information about Function App naming rule"
  type = string
  default = ""
}

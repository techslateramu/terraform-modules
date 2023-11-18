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

variable "location" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group. Changing this forces a new resource to be created."
}


variable "log_analytics_workspace_sku" {
  description = "Specifies the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new Sku as of 2018-04-03). Defaults to PerGB2018."
  default     = "PerGB2018"
}

variable "log_analytics_workspace_retention_in_days" {
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  default     = "30"
}

variable "log_analytics_workspace_daily_quota_gb" {
  description = "The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  default     = 1
}

variable "log_analytics_workspace_internet_ingestion_enabled" {
  description = "Should the Log Analytics Workflow support ingestion over the Public Internet? Defaults to true."
  default     = true
}

variable "log_analytics_workspace_internet_query_enabled" {
  description = "Should the Log Analytics Workflow support querying over the Public Internet? Defaults to true."
  default     = true
}


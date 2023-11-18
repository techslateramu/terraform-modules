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
  description = "(Required) The name of the resource group . Changing this forces a new resource to be created."
}

variable "service_plan_id" {
  description = "(Required) Service plan id"
  default     = ""
}

variable "identity" {
  type = list(object({
    type         = string
    identity_ids = optional(list(string))
  }))
}

variable "connection_string" {
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "site_config" {
  type = list(object({
    always_on             = optional(bool)
    api_definition_url    = optional(string)
    api_management_api_id = optional(string)
    app_command_line      = optional(string)

    application_stack = optional(list(object({
      dotnet_version   = optional(string)
      go_version       = optional(string)
      java_server      = optional(string)
      docker_image     = optional(string)
      docker_image_tag = optional(string)
    })))

    auto_heal_enabled                             = optional(bool)
    container_registry_managed_identity_client_id = optional(string)
    container_registry_use_managed_identity       = optional(string)

    cors = optional(list(object({
      allowed_origins     = set(string)
      support_credentials = optional(bool)
    })))

    default_documents = optional(list(string))
    ftps_state        = optional(string)
    health_check_path = optional(string)
    http2_enabled     = optional(bool)

    ip_restriction = optional(list(object({
      ip_address                = optional(string)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      action                    = optional(string)
      headers = optional(list(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(string))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      })))
    })))

    load_balancing_mode      = optional(string)
    local_mysql_enabled      = optional(bool)
    managed_pipeline_mode    = optional(string)
    minimum_tls_version      = optional(string)
    remote_debugging_enabled = optional(bool)
    remote_debugging_version = optional(string)

    scm_ip_restriction = optional(list(object({
      ip_address                = optional(string)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      action                    = optional(string)
      headers = optional(list(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(string))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      })))
    })))

    scm_minimum_tls_version     = optional(string)
    scm_use_main_ip_restriction = optional(bool)
    use_32_bit_worker           = optional(bool)
    vnet_route_all_enabled      = optional(bool)
    websockets_enabled          = optional(bool)

  }))
}
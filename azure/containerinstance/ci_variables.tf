variable "environment" {
  type        = string
  description = "(Required) Custom variable. This the enviorment name where the resouce group will be created."

  validation {
    condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "hub" || var.environment == "uat" || var.environment == "prod" || var.environment == "tst"
    error_message = "Invalid environment name. Should be one of these - dev,qa,hub,uat,prod,tst."
  }
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "main_project" {
  type        = string
  description = "(Required) Custom variable. Main project name."
}

variable "sub_project" {
  type        = string
  description = "(Required) Custom variable. Sub project name."
}

variable "os_type" {
  description = "The operating system type for the container group"
  default     = "Linux"
}

variable "container_name" {
  description = "The name for the container"
  default     = "example-container"
}

variable "container_image" {
  description = "The container image to use"
  default     = "nginx:latest"
}

variable "container_cpu" {
  description = "The CPU resources allocated to the container"
  default     = "0.5"
}

variable "container_memory" {
  description = "The memory resources allocated to the container"
  default     = "1.5"
}

variable "container_port" {
  description = "The container port to expose"
  default     = 80
}

variable "container_port_protocol" {
  description = "The protocol for the container port"
  default     = "TCP"
}

variable "dns_name_label" {
  description = "The DNS name label for the ACI"
  default     = "ngixmy143"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
}
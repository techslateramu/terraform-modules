output "app_service_name" {
  description = "The ID of the App Service Plan component."
  value       = azurerm_service_plan.app_service_plan.name
}

output "app_service_id" {
  description = "Name of the App Service Plan component."
  value       = azurerm_service_plan.app_service_plan.id
}

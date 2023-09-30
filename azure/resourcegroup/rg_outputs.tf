output "id" {
  description = "The id of the resource group."
  value       = azurerm_resource_group.resource_group.id
}

output "name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.resource_group.name
}
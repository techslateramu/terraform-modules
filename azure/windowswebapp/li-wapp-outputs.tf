output "id" {
  description = "The ID of the azurerm_windows_web_app App"
  value       = azurerm_windows_web_app.windows_web_app.id
}

output "default_hostname" {
  description = "The default_hostname of the azurerm_windows_web_app App"
  value       = azurerm_windows_web_app.windows_web_app.default_hostname
}
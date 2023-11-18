output "id" {
  description = "The ID of the linuxwebapp App"
  value       = azurerm_linux_web_app.linux_web_app.id
}

output "default_hostname" {
  description = "The default_hostname of the linuxwebapp App"
  value       = azurerm_linux_web_app.linux_web_app.default_hostname
}

output "identity" {
  description = "Identity"
  value       = azurerm_linux_web_app.linux_web_app.identity
}
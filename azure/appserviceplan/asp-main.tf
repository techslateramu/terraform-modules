# Create service plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.asp_sku_size
  os_type             = var.asp_os_type
  tags                = var.tags
}

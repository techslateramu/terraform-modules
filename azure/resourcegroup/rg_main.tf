module "azure_region" {
  source       = "claranet/regions/azurerm"
  version      = ">=6"
  azure_region = var.location
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = module.azure_region.location
  tags     = var.tags
}
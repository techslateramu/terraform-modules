module "azure_region" {
  source       = "claranet/regions/azurerm"
  version      = ">=6"
  azure_region = var.location
}
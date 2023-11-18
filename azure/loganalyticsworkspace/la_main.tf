resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention_in_days
  daily_quota_gb      = var.log_analytics_workspace_daily_quota_gb
  tags                = var.tags

  internet_ingestion_enabled = var.log_analytics_workspace_internet_ingestion_enabled
  internet_query_enabled     = var.log_analytics_workspace_internet_query_enabled
}

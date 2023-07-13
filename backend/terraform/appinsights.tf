resource "azurerm_application_insights" "appinsights" {
  name                = var.appinsightsname
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.loganalyticsworkspacename
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 90
}
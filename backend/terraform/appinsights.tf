resource "azurerm_application_insights" "appinsights" {
  name                = var.appinsightsname
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}
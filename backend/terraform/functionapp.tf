resource "azurerm_app_service_plan" "service_plan" {
  name                = var.serviceplanname
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "function_app" {
  name                       = var.functionname
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.service_plan.id
  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key

  app_settings = {
    "AzureWebJobsStorage"            = azurerm_storage_account.storage_account.primary_connection_string
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet"
    "ResumeConnectionString"         = azurerm_cosmosdb_account.dbaccount.primary_sql_connection_string
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appinsights.instrumentation_key
  }

  site_config {
    cors {
      allowed_origins = ["*"]
    }
  }

  version = "~4"

}

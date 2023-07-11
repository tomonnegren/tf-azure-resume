resource "azurerm_cosmosdb_account" "dbaccount" {
  name                = var.cosmosdbaccountname
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
    zone_redundant    = false ###USE TRUE###, for some reason i can't use zonal redundancy for now due to azure overload in west europe regionX)
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb" {
  name                = var.cosmosdbname
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.dbaccount.name
}

resource "azurerm_cosmosdb_sql_container" "container" {
  name                = var.cosmosdbcontainer
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.dbaccount.name
  database_name       = azurerm_cosmosdb_sql_database.cosmosdb.name
  partition_key_path  = "/id"
}
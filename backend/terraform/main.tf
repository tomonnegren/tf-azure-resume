##### Configure the Azure provider #####

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.63.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storagename
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
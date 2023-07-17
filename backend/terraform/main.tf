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


###### currently when accesing the url to the storage it downloads the index.html instead of showing the webpage, uploading via vsc function extension for now.

/*resource "azurerm_storage_blob" "image_blob" {
  for_each               = toset(var.imagefiles)
  name                   = "images/${each.value}"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"

  source = "C:/Users/tomon/Desktop/tf-azure-resume/frontend/images/${each.value}"
}

resource "azurerm_storage_blob" "html_blob" {
  name                   = var.htmlfile
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"

  source = "C:/Users/tomon/Desktop/tf-azure-resume/frontend/index.html"
}

resource "azurerm_storage_blob" "css_blob" {
  name                   = var.cssfile
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"


  source = "C:/Users/tomon/Desktop/tf-azure-resume/frontend/css/style.css"
}

resource "azurerm_storage_blob" "js_blob" {
  name                   = var.jsfile
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"


  source = "C:/Users/tomon/Desktop/tf-azure-resume/frontend/js/get_counter.js"
}*/


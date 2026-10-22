terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.10.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "shk1" {
  name     = "rg-shubair-1"
  location = "Central India"
}

resource "azurerm_storage_account" "str1" {
  name                     = "storageshubair1x"
  depends_on = [ azurerm_resource_group.shk1 ]
  resource_group_name      = "rg-shubair-1"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "ctr1" {
  depends_on = [ azurerm_storage_account.str1 ]
  name                  = "upload"
  storage_account_id    = azurerm_storage_account.str1.id
  container_access_type = "private"
}

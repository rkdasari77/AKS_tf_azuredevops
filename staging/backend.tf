terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstagebackendsa"
    container_name      = "tf-state-container"
    key                 = "stage.tfstate"
  }
}

provider "azurerm" {
  features {}
}
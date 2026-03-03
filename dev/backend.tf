terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfdevbackendsa"
    container_name      = "tf-state-container"
    key                 = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}
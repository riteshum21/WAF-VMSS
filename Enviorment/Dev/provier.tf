terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Ritesh-Dec"
    storage_account_name = "riteshstg11"
    container_name       = "riteshcnt"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5416df71-d346-4f44-91f2-dacb0ad37467"
}

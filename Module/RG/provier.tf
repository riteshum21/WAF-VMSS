terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Ritesh-Feb"
    storage_account_name = "riteshstg21"
    container_name       = "riteshcnt"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "197948ef-973c-4ecc-89ae-2c6259878bb3"
}

data "azurerm_subnet" "bsubnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "wafvnet"
  resource_group_name  = "ram"
}



data "azurerm_public_ip" "pip1" {
  name                = "BasionIP"
  resource_group_name = "ram"
}
data "azurerm_subnet" "AGsubnet" {
  name                 = "AppGatewaySubnet"
  virtual_network_name = "wafvnet"
  resource_group_name  = "ram"
}



data "azurerm_public_ip" "pip2" {
  name                = "AppGwIP"
  resource_group_name = "ram"
}
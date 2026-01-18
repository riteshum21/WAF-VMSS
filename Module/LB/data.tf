data "azurerm_subnet" "lbsubnet" {
  name                 = "lbSubnet"
  virtual_network_name = "wafvnet"
  resource_group_name  = "ram"
}



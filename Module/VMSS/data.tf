
data "azurerm_subnet" "subnets" {
  for_each = var.vmss

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  resource_group_name = var.appgw_rg
}

data "azurerm_application_gateway_backend_address_pool" "appgw_pool" {
  name                   = var.appgw_backend_pool_name
  application_gateway_id = data.azurerm_application_gateway.appgw.id
}

data "azurerm_lb" "lb" {
  name                = var.lb_name
  resource_group_name = var.lb_rg
}

data "azurerm_lb_backend_address_pool" "lb_pool" {
  name            = var.lb_backend_pool_name
  loadbalancer_id = data.azurerm_lb.lb.id
}


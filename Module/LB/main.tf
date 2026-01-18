resource "azurerm_lb" "internal_lb" {

  for_each = var.lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = each.value.frontend_ip_configuration_name
    subnet_id                     = data.azurerm_subnet.lbsubnet.id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    private_ip_address            = each.value.private_ip_address
  }  
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.lb
  name            = each.value.backend_pool_name
  loadbalancer_id = azurerm_lb.internal_lb[each.key].id
}


resource "azurerm_lb_probe" "probe" {
  for_each = var.lb
  name            = each.value.probe_name
  loadbalancer_id = azurerm_lb.internal_lb[each.key].id
  protocol        = each.value.probe_protocol
  port            = each.value.probe_port
}

resource "azurerm_lb_rule" "rule" {
  for_each = var.lb
  name                           = each.value.rule_name
  loadbalancer_id                = azurerm_lb.internal_lb[each.key].id
  protocol                       = each.value.rule_protocol
  frontend_port                  = each.value.rule_frontend_port
  backend_port                   = each.value.rule_backend_port
  frontend_ip_configuration_name = each.value.rule_frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}



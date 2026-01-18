resource "azurerm_application_gateway" "appgw" {
  for_each = var.AGw
  name                = "appgw-demo"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku {
    name     = each.value.sku_name
    tier     = each.value.tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = each.value.ip_config_name
    subnet_id = data.azurerm_subnet.AGsubnet.id
  }

  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = data.azurerm_public_ip.pip2.id
  }

  backend_address_pool {
    name = each.value.backend_address_pool_name
    # VM / VMSS private IPs yaha add hote hain
    ip_addresses = ["10.0.2.4"]
  }

  backend_http_settings {
    name                  = each.value.backend_http_settings_name
    port                  = each.value.backend_port
    protocol              = each.value.backend_protocol
    cookie_based_affinity = each.value.cookie_based_affinity
    request_timeout       = each.value.request_timeout
  }

  http_listener {
    name                           = each.value.listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = each.value.listener_protocol
  }

  request_routing_rule {
    name                       = each.value.routing_rule_name
    rule_type                 = each.value.rule_type
    http_listener_name         = each.value.http_listener_name
    backend_address_pool_name  = each.value.backend_address_pool_name
    backend_http_settings_name = each.value.backend_http_settings_name
    priority                   = each.value.priority
  }
}

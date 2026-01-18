lb = {
  internal_lb = {
    name                = "internal-lb"
    location            = "japaneast"
    resource_group_name = "ram"
    sku                 = "Standard"

    frontend_ip_configuration_name = "internal-frontend"
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.5.100"
    backend_pool_name              = "internal-backend-pool"

    probe_name = "tcp-probe"

    probe_protocol = "Tcp"
    probe_port     = 80

    rule_name                           = "lb-rule"
    rule_protocol                       = "Tcp"
    rule_frontend_port                  = 80
    rule_backend_port                   = 80
    rule_frontend_ip_configuration_name = "internal-frontend"


  }
}

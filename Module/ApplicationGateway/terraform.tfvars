AGw = {
  AGw1 = {
    name                = "appgw-demo"
    location            = "japaneast"
    resource_group_name = "ram"


    sku_name = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2

    ip_config_name = "appgw-ipcfg"



    frontend_port_name = "frontend-port"
    frontend_port      = 80



    frontend_ip_name = "frontend-ip"



    backend_address_pool_name = "backend-pool"
    # VM / VMSS private IPs yaha add hote hain
    ip_addresses = ["10.0.2.4"]



    backend_http_settings_name = "backend-http"
    backend_port               = 80
    backend_protocol           = "Http"
    cookie_based_affinity      = "Disabled"
    request_timeout            = 30



    listener_name                  = "http-listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "frontend-port"
    listener_protocol              = "Http"



    routing_rule_name          = "rule-1"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-http"
    priority                   = 100
  }
}

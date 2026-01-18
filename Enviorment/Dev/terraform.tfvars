RG = {
  rg1 = {
    name     = "ram"
    location = "japaneast"
  }
}

stg = {
  stg1 = {
    name                     = "stg1890"
    resource_group_name      = "ram"
    location                 = "japaneast"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

PIP = {
  PIP1 = {

    name                = "BasionIP"
    resource_group_name = "ram"
    location            = "Japaneast"
    allocation_method   = "Static"

    tags = {
      environment = "Production"
    }
  }

  PIP2 = {
    name                = "AppGwIP"
    resource_group_name = "ram"
    location            = "Japaneast"
    allocation_method   = "Static"

    tags = {
      environment = "Production"
    }
  }
}


network = {
  vne1 = {
    name                = "wafvnet"
    location            = "Japaneast"
    resource_group_name = "ram"
    address_space       = ["10.0.0.0/16"]

    subnet = {

      subnet1 = {
        name             = "bsubnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      subnet2 = {
        name             = "fsubnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet3 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
      subnet4 = {
        name             = "AppGatewaySubnet"
        address_prefixes = ["10.0.4.0/24"]
      }
      subnet5 = {
        name             = "lbSubnet"
        address_prefixes = ["10.0.5.0/24"]
      }
    }
    tags = {
      environment = "Production"
    }
  }
}
log_anl = {
  log_analy_wks = {
    name                = "loganalysis"
    location            = "japaneast"
    resource_group_name = "ram"
    sku                 = "PerGB2018"
    retention_in_days   = 30
} }

sql_server = {
    ss = {
    name                         = "rssqls21"
    resource_group_name          = "ram"
    location                     = "japaneast"
    version                      = "12.0"
    administrator_login          = "sqlrs"
    administrator_login_password = "Factor@666666"

    }
}

my_sql = {
  sqldb = {
    name         = "sqldb1"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "Basic"
    enclave_type = "Default"
  }
}

keyvault = {
  KV1 = {

  name                        = "prskv129"
  location                    = "japaneast"
  resource_group_name         = "ram"
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  key_permissions = [
    "Get", "Create", "List",
  ]
  secret_permissions = [
    "Get", "Set", "List", "Delete"
  ]
  storage_permissions = [
    "Get", "List",
  ]


}

}

Bastion = {
  Bastion1 = {
  name                = "newBastion"
  location            = "Japaneast"
  resource_group_name = "ram"
  }
}
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

  vmss = {
  vmss1 = {

    name                = "fvmss"
    resource_group_name = "ram"
    location            = "japaneast"
    sku_name               = "Standard_D2s_v3"
    instances           = 1
    admin_username      = "adminuser"
    admin_password      = "Factor@666666"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    os_storage_account_type = "Standard_LRS"
    caching                 = "ReadWrite"

    nic_name    = "fnic"
    primary     = true
    vnet_name = "wafvnet"
    subnet_name = "fsubnet"

  }
  vmss2 = {

    name                = "bvmss"
    resource_group_name = "ram"
    location            = "japaneast"
    sku_name                 = "Standard_D2s_v3"
    instances           = 1
    admin_username      = "adminuser"
    admin_password      = "Factor@666666"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    os_storage_account_type = "Standard_LRS"
    caching                 = "ReadWrite"

    nic_name    = "fnic"
    primary     = true
    vnet_name = "wafvnet"
    subnet_name = "bsubnet"

  }

}

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







  
    

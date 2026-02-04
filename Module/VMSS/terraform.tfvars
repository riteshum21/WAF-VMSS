# ----------------------------
# Application Gateway
# ----------------------------
appgw_name              = "appgw-demo"
appgw_rg                = "ram"
appgw_backend_pool_name = "fvmss-backend-pool"

# ----------------------------
# Load Balancer
# ----------------------------
lb_name              = "internal-lb"
lb_rg                = "ram"
lb_backend_pool_name = "bvmss-backend-pool"

# ----------------------------
# VMSS definitions
# ----------------------------
vmss = {
  fvmss = {
    name                = "fvmss"
    role                = "frontend"
    resource_group_name = "ram"
    location            = "japaneast"
    sku_name            = "Standard_D2s_v3"
    instances           = 1

    admin_username = "adminuser"
    admin_password = "Factor@666666"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    os_storage_account_type = "Standard_LRS"
    caching                 = "ReadWrite"

    nic_name    = "fvmss-nic"
    primary     = true
    vnet_name   = "wafvnet"
    subnet_name = "fsubnet"
  }

  bvmss = {
    name                = "bvmss"
    role                = "backend"
    resource_group_name = "ram"
    location            = "japaneast"
    sku_name            = "Standard_D2s_v3"
    instances           = 1

    admin_username = "adminuser"
    admin_password = "Factor@666666"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    os_storage_account_type = "Standard_LRS"
    caching                 = "ReadWrite"

    nic_name    = "bvmss-nic"
    primary     = true
    vnet_name   = "wafvnet"
    subnet_name = "bsubnet"
  }
}

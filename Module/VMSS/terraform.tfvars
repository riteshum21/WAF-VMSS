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







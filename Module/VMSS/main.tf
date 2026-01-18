resource "azurerm_linux_virtual_machine_scale_set" "example" {
  for_each = var.vmss
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku_name
  instances           = 1
  admin_username      = "adminuser"
  admin_password      = "Factor@666666"
 disable_password_authentication = false
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  os_disk {
    storage_account_type = each.value.os_storage_account_type
    caching              = each.value.caching
  }

  network_interface {
    name    = each.value.nic_name
    primary = each.value.primary

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.subnets[each.key].id
          }
  }
}



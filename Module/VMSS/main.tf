resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  for_each = var.vmss

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku_name
  instances           = each.value.instances

  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
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

  # Frontend VMSS → Application Gateway
  application_gateway_backend_address_pool_ids =
    each.value.role == "frontend"
    ? [data.azurerm_application_gateway_backend_address_pool.appgw_pool.id]
    : null

  # Backend VMSS → Internal Load Balancer
  load_balancer_backend_address_pool_ids =
    each.value.role == "backend"
    ? [data.azurerm_lb_backend_address_pool.lb_pool.id]
    : null
}
  }
}
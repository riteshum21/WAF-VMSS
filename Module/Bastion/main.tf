
resource "azurerm_bastion_host" "Bastion" {
  for_each = var.Bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
        name                 = "configuration"
    subnet_id            = data.azurerm_subnet.bsubnet.id
    public_ip_address_id = data.azurerm_public_ip.pip1.id
  }
}





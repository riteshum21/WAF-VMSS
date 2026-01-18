
resource "azurerm_log_analytics_workspace" "log_anl" {
 for_each = var.log_anl
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  retention_in_days   = each.value.retention_in_days
}

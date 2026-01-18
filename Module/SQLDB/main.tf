
resource "azurerm_mssql_database" "my_sql" {
  for_each = var.my_sql
  name         = each.value.name  
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type   
server_id    = data.azurerm_mssql_server.sqls1.id


}
 

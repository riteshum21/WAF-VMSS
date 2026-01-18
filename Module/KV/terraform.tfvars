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
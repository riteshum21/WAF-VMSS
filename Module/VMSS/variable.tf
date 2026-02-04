variable "vmss" {
  type = map(object({
    name                = string
    role                = string   # frontend | backend
    resource_group_name = string
    location            = string
    sku_name            = string
    instances           = number

    admin_username = string
    admin_password = string

    publisher = string
    offer     = string
    sku       = string
    version   = string

    os_storage_account_type = string
    caching                 = string

    nic_name    = string
    primary     = bool
    vnet_name   = string
    subnet_name = string
  }))
}

variable "appgw_name" {
  type = string
}

variable "appgw_rg" {
  type = string
}

variable "appgw_backend_pool_name" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "lb_rg" {
  type = string
}

variable "lb_backend_pool_name" {
  type = string
}

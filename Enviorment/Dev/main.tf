module "RG" {
  source = "../../Module/RG"
  RG     = var.RG
}

module "stg" {
  source     = "../../Module/StorageACC"
  stg        = var.stg
  depends_on = [module.RG]
}

module "PIP" {
  source     = "../../Module/PIP"
  depends_on = [module.RG]
  PIP        = var.PIP
}

module "networks" {
  source     = "../../Module/Network"
  depends_on = [module.RG]
  network    = var.network
}

module "LogAnalyWorkspace" {
  source     = "../../Module/LogAnalysi"
  depends_on = [module.RG]
  log_anl    = var.log_anl
}

module "Sql_SS" {
  source     = "../../Module/SQLServer"
  sql_server = var.sql_server
  depends_on = [module.RG]
}

module "Sql_db" {
  source = "../../Module/SQLDB"
  my_sql = var.my_sql
  depends_on = [ module.RG, module.Sql_SS ]
}

module "kv" {
  source = "../../Module/KV"
  keyvault = var.keyvault
  depends_on = [ module.RG ]  
}

module "Bastion" {
  source = "../../Module/Bastion"
  Bastion = var.Bastion
  depends_on = [ module.RG, module.networks, module.PIP ]
  
}
module "appgw" {
  source = "../../Module/ApplicationGateway"
  AGw = var.AGw
  depends_on = [ module.networks, module.RG, module.PIP ]
}

module "vmss" {
  source = "../../Module/VMSS"
  depends_on = [ module.RG, module.networks, module.kv, module.LogAnalyWorkspace ]
  vmss = var.vmss
}

module "lb" {
  source = "../../Module/LB"
  depends_on = [ module.RG, module.networks ]
  lb = var.lb
}


network =  {
    vne1 = {
  name                = "wafvnet"
  location            = "Japaneast"
  resource_group_name = "ram"
  address_space       = ["10.0.0.0/16"]
 
  subnet = {
   
     subnet1 =     {
         name             = "bsubnet"
    address_prefixes = ["10.0.2.0/24"]
    }
     subnet2 =     {
         name      = "fsubnet"
    address_prefixes = ["10.0.1.0/24"]
    }
  subnet3 =     {
         name             = "AzureBastionSubnet"
    address_prefixes = ["10.0.3.0/24"]
    }
 subnet4 =     {
         name             = "AppGatewaySubnet"
    address_prefixes = ["10.0.4.0/24"]
    }
    subnet5 =     {
         name             = "lbSubnet"
    address_prefixes = ["10.0.5.0/24"]
    } 
  }
  tags = {
    environment = "Production"
  }
}
    }

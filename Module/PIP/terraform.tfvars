PIP = {
    PIP1 = {
        
  name                = "BasionIP"
  resource_group_name = "ram"
  location            = "Japaneast"
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
 
    PIP2 = {
  name                = "AppGwIP"
  resource_group_name = "ram"
  location            = "Japaneast"
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
}

    
resource "azurerm_network_interface" "testinterface" {
  name                = "testinterface"
  location            = local.location  
  resource_group_name = local.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"    
  }

  depends_on = [
    azurerm_virtual_network.webapptestvnet
  ]
}

resource "azurerm_windows_virtual_machine" "webappvm" {
  name                = "webappvm"
  resource_group_name = local.resource_group_name
  location            = local.location
  size                = "Standard_B2ms"
  admin_username      = "adminuser"
  admin_password      = "Azure@123"
  availability_set_id = azurerm_availability_set.Webappavset.id
  network_interface_ids = [
    azurerm_network_interface.testinterface.id,

  ]
 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
 
   depends_on = [
    azurerm_virtual_network.webapptestvnet,
    azurerm_network_interface.testinterface,
    azurerm_availability_set.Webappavset
  ]

}
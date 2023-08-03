resource "azurerm_managed_disk" "appdatabase" {
  name                 = "appdatabase"
  location             = local.location
  resource_group_name  = local.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "64"

  tags = {
    environment = "testing tf code "
  }
}
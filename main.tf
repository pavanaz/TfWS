resource "azurerm_resource_group" "terraformtest" {
  name ="terraformtest"
  location= "West US"
}
locals {
  resource_group_name="terraformtest"
  location="West US"
  virtual_network={
    name="Webapptsetvnet"
    address_space="10.0.2.0/24"
  }
}
resource "azurerm_availability_set" "Webappavset" {
  name                = "webapp-avset"
  location            = local.location
  resource_group_name = local.resource_group_name
  depends_on = [ azurerm_resource_group.terraformtest ]

}
resource "azurerm_virtual_network" "Webapptestvnet" {
  name = "Webapptsetvnet"
  resource_group_name = "terraformtest"
  location = "West US"
  address_space = "10.0.2.0/24"


  depends_on = [
    azurerm_resource_group.terraformtest
  ]
}

resource "azurerm_subnet" "subnetA" {
  name = "subnetA"
  resource_group_name = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes = ["10.0.2.1/24"]

  depends_on = [
    azurerm_virtual_network.Webapptestvnet]

  }
resource "azurerm_subnet" "subnetB" {
  name = "subnetB"
  resource_group_name = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes = ["10.0.2.2/24"]

  depends_on = [
    azazurerm_virtual_network.Webapptestvnet
  ]
  }

 
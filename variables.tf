locals {
  resource_group_name="terraformtest"
  location="West US"
  virtual_network={
    name="Webapptsetvnet"
    address_space="10.0.2.0/24"
  }
}
variable "number_of_machines" {
  type = number
  description = "This defines the number of virtual machines in the virtual network"
  default = 3  
}
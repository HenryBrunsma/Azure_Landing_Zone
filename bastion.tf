resource "azurerm_bastion_host" "LZ_Bastion" {
    name            = var.Bastion_name
    location        = azurerm_resource_group.LandingZone.location
    resource_group_name = azurerm_resource_group.LandingZone.name

    ip_configuration {
        name            = "configuration"
        subnet_id       = azurerm_subnet.Bastion.id
        public_ip_address_id = azurerm_public_ip.public_ip.id 

    }
}
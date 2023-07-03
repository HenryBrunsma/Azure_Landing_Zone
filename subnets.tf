resource "azurerm_subnet" "subnet1" {
    name            = var.subnet1_name
    resource_group_name = azurerm_resource_group.LandingZone.name
    virtual_network_name =azurerm_virtual_network.LZNetwork.name
    address_prefixes = var.S1_addy_prefixes
}

resource "azurerm_subnet" "subnet2" {
    name            = var.subnet2_name
    resource_group_name = azurerm_resource_group.LandingZone.name
    virtual_network_name = azurerm_virtual_network.LZNetwork.name
    address_prefixes = var.S2_addy_prefixes
}

resource "azurerm_subnet" "Bastion" {
    name            = "AzureBastionSubnet"
    resource_group_name = azurerm_resource_group.LandingZone.name
    virtual_network_name = azurerm_virtual_network.LZNetwork.name
    address_prefixes     = var.Bastion_addy_prefixes
}
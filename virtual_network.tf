resource "azurerm_virtual_network" "LZNetwork" {
    name            = "landing_zone_network"
    resource_group_name = azurerm_resource_group.LandingZone.name
    location        = azurerm_resource_group.LandingZone.location
    address_space   = var.VN_address_space
}
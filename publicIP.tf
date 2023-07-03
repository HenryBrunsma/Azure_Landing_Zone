resource "azurerm_public_ip" "public_ip" {
    name            = var.public_ip_name
    location        = azurerm_resource_group.LandingZone.location
    resource_group_name = azurerm_resource_group.LandingZone.name
    allocation_method = "Static"
    sku               = "Standard"
}
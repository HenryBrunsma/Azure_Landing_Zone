resource "azurerm_resource_group" "LandingZone" {
    name    = var.RG_name
    location = var.RG_location
}
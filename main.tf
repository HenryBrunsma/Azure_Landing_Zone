terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=3.62.0"
        }
    }
}

provider "azurerm" {
    features()
}

resource "azurerm_resource_group" "LandingZone" {
    name    = var.RG_name
    location = var.RG_location
}

resource "azurerm_virtual_network" "LZNetwork" {
    name            = "landing_zone_network"
    resource_group_name = azurerm_resource_group.LandingZone.name
    location        = azurerm_resource_group.LandingZone.location
    address_space   = var.VN_address_space
}

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
resource "azurerm_public_ip" "public_ip" {
    name            = var.public_ip_name
    location        = azurerm_resource_group.LandingZone.location
    resource_group_name = azurerm_resource_group.LandingZone.name
    allocation_method = "Static"
    sku               = "Standard"
}

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



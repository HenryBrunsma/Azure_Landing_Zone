variable "RG_name" {
    description = "value of the Name tag for the Resource group"
    type        = string
    default     = "Landing_Zone"
}
variable "RG_location" {
    description = "where the resource group will be located"
    type        = string
    default     = "East US"
}
variable "VN_address_space" {
    description = "size of the address pool"
    type        = list(string)
    default     = ["10.0.0.0/16"]
}
variable "subnet1_name" {
    description = "name of one subnet created"
    type        = string
    default     = "Subnet_1"
}
variable "S1_addy_prefixes" {
    description = "decimal value indicating the number of leftmost contiguous bits of the address"
    type        = list(string)
    default     = ["10.0.1.0/24"]
}
variable "subnet2_name" {
description = "name of the second subnet created"
type        = string
default     = "Subnet_2"
}
variable "S2_addy_prefixes" {
    description = "prefix for the second subnet"
    type        = list(string)
    default     =["10.0.2.0/24"]
}
variable "Bastion_addy_prefixes" {
    description = "prefix for the bastion host subnet, must have a prefix of at least /27"
    type        = list(string)
    default     = ["10.0.0.0/27"]
}
variable "public_ip_name" {
    description = "name of the public IP"
    type        = string
    default     = "LZ_PublicIP"
}
variable "Bastion_name" {
    description = "name of the bastion host"
    type        = string
    default     = "LZ_Bastion"
}
variable "business_unit" {
  type        = string
  description = "Business Unit"
}

variable "network_cidr_block" {
  type        = string
  description = "Network CIDR Block"
}

variable "public_cidr_block" {
  type        = string
  description = "Public CIDR Block from network_cidr_block"
}

variable "user" {
  type        = string
  description = "User Name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

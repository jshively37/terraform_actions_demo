variable "bucket_name" {
  description = "HCP bucket name"
}

variable "business_unit" {
  type        = string
  description = "Business Unit"
}

variable "channel" {
  description = "HCP channel name"
  default     = "production"
}

variable "cloud_provider" {
  description = "Cloud provider to use"
  default     = "aws"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
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

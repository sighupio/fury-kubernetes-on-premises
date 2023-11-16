variable "name" {
  type        = string
  description = "Name to assign to the vpc and prefix for the vms"
}

variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr to assign to the vpc"
}

variable "private_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR to assign to the private subnet"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "10.0.101.0/24"
  description = "CIDR to assign to the public subnet"
}

variable "enable_nat_gw" {
  type    = bool
  default = false
}

variable "single_nat_gw" {
  type    = bool
  default = false
}


variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags to apply to the resources"
}

variable "public_key" {
  type        = string
  description = "The ssh public key the user wants to use to access the instance"
}

variable "dns_zone" {
  type        = string
  description = "The DNS zone where all records will be created"
}
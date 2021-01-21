variable "accepter_owner_id" {
  description = "Account ID of accepter"
}

variable "accepter_vpc_id" {
  description = "VPC ID of accepter"
}

variable "accepter_region" {
  description = "Region of acccepter"
}

variable "requester_owner_id" {
  description = "Account ID of requester"
}

variable "requester_vpc_id" {
  description = "VPC ID of requester"
}

variable "requester_region" {
  description = "Region of requester"
}

variable "requester_subnet" {
  description = "Name of the requester subnet tag to be peered"
  default = "transit"
}
variable "serial" {
  default     = 0
  description = "Number of this peering, distinct from others, to avoid conflict with NACL rule number"
}
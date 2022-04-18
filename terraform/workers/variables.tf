variable "public_key" {
  type = string
}

variable "auth_url" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "user_name" {
  type = string
}

variable "user_password" {
  type = string
}

variable "selectel_token" {
  type = string
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.0.0/24"
}

variable "region" {
  type    = string
  default = "ru-3"
}

variable "az_zone" {
  type    = string
  default = "ru-3b"
}

variable "volume_type" {
  type    = string
  default = "fast.ru-3b"
}

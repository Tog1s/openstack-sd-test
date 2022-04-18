variable "vms_count" {
  default = 1
}

variable "vm_ram" {
  default = "512"
}

variable "vm_vcpus" {
  default = "1"
}

variable "vm_disk_index" {
  default = 0
}

variable "az_zone" {}
variable "disk_size" {}
variable "key_pair_id" {}
variable "network_id" {}
variable "prefix_name" {}
variable "region" {}
variable "volume_type" {}

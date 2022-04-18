terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.43.0"
    }
    selectel = {
      source  = "selectel/selectel"
      version = "~> 3.6.2"
    }
  }
}

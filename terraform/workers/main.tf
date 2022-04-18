resource "openstack_compute_keypair_v2" "key" {
  name       = "key"
  region     = var.region
  public_key = var.public_key
}

resource "openstack_networking_router_v2" "router" {
  name                = "router_tf"
  external_network_id = data.openstack_networking_network_v2.external_net.id
}

resource "openstack_networking_network_v2" "network" {
  name = "network"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id = openstack_networking_network_v2.network.id
  name       = "subnet_tf"
  cidr       = var.subnet_cidr
}

resource "openstack_networking_router_interface_v2" "router_interface_tf" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}

module "app_vm" {
  source      = "../modules/vms"
  count       = 2
  az_zone     = var.az_zone
  region      = var.region
  volume_type = var.volume_type
  disk_size   = "16"
  prefix_name = "app-server"
  network_id  = openstack_networking_network_v2.network.id
  key_pair_id = openstack_compute_keypair_v2.key.id
}

module "monitoring_vm" {
  source      = "../modules/vms"
  az_zone     = var.az_zone
  region      = var.region
  volume_type = var.volume_type
  disk_size   = "16"
  prefix_name = "monitoring"
  network_id  = openstack_networking_network_v2.network.id
  key_pair_id = openstack_compute_keypair_v2.key.id
}


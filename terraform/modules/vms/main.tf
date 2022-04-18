resource "openstack_compute_flavor_v2" "flavor_server" {
  name      = "server-${random_string.random_name_server.result}"
  ram       = var.vm_ram
  vcpus     = var.vm_vcpus
  disk      = var.vm_disk_index
  is_public = "false"
}

resource "openstack_blockstorage_volume_v3" "volume_server" {
  name                 = "vol-${var.prefix_name}-${random_string.random_name_sufix.result}"
  size                 = var.disk_size
  image_id             = data.openstack_images_image_v2.ubuntu_image.id
  volume_type          = var.volume_type
  availability_zone    = var.az_zone
  enable_online_resize = true
  lifecycle {
    ignore_changes = [image_id]
  }
}

resource "openstack_compute_instance_v2" "server" {
  name              = "${var.prefix_name}-${random_string.random_name_sufix.result}"
  flavor_id         = openstack_compute_flavor_v2.flavor_server.id
  key_pair          = var.key_pair_id
  availability_zone = var.az_zone

  network {
    uuid = var.network_id
  }

  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_server.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }

  vendor_options {
    ignore_resize_confirmation = true
  }

  lifecycle {
    ignore_changes = [image_id]
  }
}

resource "random_string" "random_name_server" {
  length  = 16
  special = false
}

resource "random_string" "random_name_sufix" {
  length  = 4
  upper   = false
  special = false
}

resource "openstack_networking_floatingip_v2" "fip" {
  pool = "external-network"
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.server.id
}
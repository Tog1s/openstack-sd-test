output "vm_fip_address" {
  value = openstack_networking_floatingip_v2.fip.address
}

output "vm_name" {
  value = openstack_compute_instance_v2.server.name
}

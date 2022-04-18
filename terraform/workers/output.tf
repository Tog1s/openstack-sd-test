output "app_ip" {
  value = module.app_vm.*.vm_fip_address
}

output "monitoring_ip" {
  value = module.monitoring_vm.*.vm_fip_address
}

# output "inventory" {
# value = <<INVENTORY
# {
#   "_meta": {
#   "hostvars": {}},
#   "children": {
#     "app": {
#       "hosts": [%{ for ip in module.app_vm.*.vm_fip_address }"${ip}"%{ endfor }],
#       "vars": {}
#     },
#     "monitoring": {
#       "hosts": [%{ for ip in module.monitoring_vm.*.vm_fip_address }"${ip}"%{ endfor }],
#       "vars": {}
#     }
#   }
# }
#   INVENTORY
# }
output "inventory" {
  value = <<EOT
[app]
%{for ip in module.app_vm.*.vm_fip_address} ${ip}
%{endfor}
[monitoring]
%{for ip in module.monitoring_vm.*.vm_fip_address} ${ip}
%{endfor}
  EOT
}
provider "openstack" {
  auth_url    = var.auth_url
  domain_name = var.domain_name
  tenant_id   = var.tenant_id
  user_name   = var.user_name
  password    = var.user_password
  region      = var.region
}

provider "selectel" {
  token = var.selectel_token
}

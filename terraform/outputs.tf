output "external_ip_address_srv" {
  value = module.project_cluster[*].external_ip_address_srv
}

output "external_ip_address_master" {
  value = module.project_cluster[*].external_ip_address_master
}

output "external_ip_address_app" {
  value = module.project_cluster[*].external_ip_address_app
}

output "internal_ip_address_srv" {
  value = module.project_cluster[*].internal_ip_address_srv
}

output "internal_ip_address_master" {
  value = module.project_cluster[*].internal_ip_address_master
}

output "internal_ip_address_app" {
  value = module.project_cluster[*].internal_ip_address_app
}
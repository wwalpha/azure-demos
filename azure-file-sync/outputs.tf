output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "sa_container_name" {
  value = module.storage.sa_container_name
}

output "sa_share_name" {
  value = module.storage.sa_share_name
}

output "source_private_ip_address" {
  value = module.computing.agent_private_ip_address
}

output "target_private_ip_address" {
  value = module.computing.target_private_ip_address
}

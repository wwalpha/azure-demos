output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "sa_container_name" {
  value = module.storage.sa_container_name
}

output "sa_public_share_name" {
  value = module.storage.sa_public_share_name
}

output "sa_private_share_name" {
  value = module.storage.sa_private_share_name
}

output "public_vm_ip_address" {
  value = module.computing.public_vm_ip_address
}

output "private_vm_ip_address" {
  value = module.computing.private_vm_ip_address
}

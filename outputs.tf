output "public_ip_address" {
  value = azurerm_public_ip.load_balancer.ip_address
}

output "website_url" {
  value = "http://${azurerm_public_ip.load_balancer.ip_address}"
}

output "ssh_command" {
  value = "ssh ${var.admin_username}@${azurerm_public_ip.load_balancer.ip_address}"
}

output "cluster_layout" {
  value = {
    control_plane = local.control_plane_ip
    workers       = local.worker_ips
  }
}

output "key_vault_name" {
  value = azurerm_key_vault.cluster.name
}


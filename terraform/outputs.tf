output "instance_id" {
  description = "Application EC2 instance ID"
  value       = module.app_server.instance_id
}

output "public_ip" {
  description = "Application EC2 public IP"
  value       = module.app_server.public_ip
}

output "private_ip" {
  description = "Application EC2 private IP"
  value       = module.app_server.private_ip
}

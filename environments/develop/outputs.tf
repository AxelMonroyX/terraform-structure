output "dns_name" {
  value       = module.nginx_instance_info.dns_name
  description = "Enter to this DNS to access the webpage"
}

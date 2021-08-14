output "dns_name" {
  value       = module.asg_example_elb.dns_name
  description = "Enter to this DNS to access the webpage"
}

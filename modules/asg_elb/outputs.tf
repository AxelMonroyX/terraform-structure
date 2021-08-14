output "dns_name" {
  value       = aws_elb.nginx_example_elb.dns_name
  description = "DNS name for access to the webpage"
}

output "aws_security_group_web" {
  value       = aws_security_group.nginx_example_allow_elb.id
  description = "This will be used to give access to the NAT"
}


output "ami_ubuntu_18_04" {
  value       = data.aws_ami.latest_ubuntu.image_id
  description = "Will output the latest AMI for latest ubuntu 18.04 hvm ebs"
}

output "ami_latest_nat" {
  value       = data.aws_ami.latest_nat.image_id
  description = "Will output the latest AMI for latest nat hvm ebs"
}

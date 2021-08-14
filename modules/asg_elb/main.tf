data "template_cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "01_start_nginx_server.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/files/start_nginx_server.sh")
  }
}

resource "aws_autoscaling_group" "nginx_example" {
  name                      = "${var.environment}-nginx-asg"
  desired_capacity          = var.size
  min_size                  = var.size
  max_size                  = var.size
  health_check_grace_period = "60"
  health_check_type         = "EC2"
  force_delete              = false
  launch_configuration      = aws_launch_configuration.nginx_example.name
  load_balancers            = ["${aws_elb.nginx_example_elb.name}"]
  vpc_zone_identifier       = var.vpc_subnets

  tag {
    key                 = "Name"
    value               = "${var.environment}-nginx-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "nginx_example" {
  name_prefix                 = "${var.environment}-nginx-lc"
  image_id                    = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  user_data                   = data.template_cloudinit_config.user_data.rendered
  associate_public_ip_address = true
  ebs_optimized               = false

  security_groups = [
    "${aws_security_group.nginx_example.id}",
    "${aws_security_group.nginx_example_allow_elb.id}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "nginx_example" {
  name        = "${var.environment}-nginx-allow-ssh-sg"
  vpc_id      = var.vpc_id
  description = "SSH inbound only and egress"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_cidr_block
  }

  tags = {
    Name        = "${var.environment}-nginx-allow-ssh-sg"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}

resource "aws_security_group" "nginx_example_allow_elb" {
  name        = "${var.environment}-nginx-allow-elb-sg"
  description = "Allow connection from elb"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-ngind-allow-elb-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_elb" "nginx_example_elb" {
  name                      = "${var.environment}-nginx-lb"
  cross_zone_load_balancing = true
  internal                  = false
  security_groups           = ["${aws_security_group.nginx_example_allow_elb.id}"]
  subnets                   = var.vpc_elb_subnets

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 4
    timeout             = 5

    target   = "HTTP:80/"
    interval = 7
  }

  tags = {
    Name        = "${var.environment}-nginx-lb"
    Environment = "${var.environment}"
  }
}

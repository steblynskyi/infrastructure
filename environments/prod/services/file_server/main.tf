# EC2 Configuration
resource "aws_instance" "fileserver" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = var.ec2_private_subnet_id
  vpc_security_group_ids  = var.security_group_ids_ec2
  iam_instance_profile    = data.aws_iam_instance_profile.ec2_instance_profile.name
  user_data               = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.prod"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=prod"
    })
  )

  disable_api_termination = true

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "100"
    delete_on_termination = true
  }

  volume_tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = false

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
    Domain      = local.app_domain
  }
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "ec2_dns" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "A"
  ttl     = "300"
  records = [aws_instance.fileserver.private_ip]
}
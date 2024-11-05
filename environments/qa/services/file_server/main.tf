# EC2 Configuration
resource "aws_instance" "fileserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.ec2_private_subnet_id
  vpc_security_group_ids = var.security_group_ids_ec2
  iam_instance_profile   = data.aws_iam_instance_profile.ec2_instance_profile.name

  user_data = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.local"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=local"
    })
  )

  associate_public_ip_address = false
  disable_api_termination     = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = "True"
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
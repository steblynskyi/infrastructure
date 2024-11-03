# EC2 Configuration
resource "aws_instance" "biztalk" {
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
  disable_api_stop            = true
  disable_api_termination     = true

  root_block_device {
    volume_type = "standard"
    volume_size = "100"
  }

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
    Domain      = local.app_domain
  }
}

# Create EBS Volume 1
resource "aws_ebs_volume" "this_1" {
  availability_zone = aws_instance.biztalk.availability_zone
  size              = 100
  type              = "gp2"
  iops              = 300

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

# EBS Volume Attachment Volume 1
resource "aws_volume_attachment" "volume_1" {
  device_name = "xvdb"
  volume_id   = aws_ebs_volume.this_1.id
  instance_id = aws_instance.biztalk.id
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb.dns_name]
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record_tripadvisor" {
  zone_id = var.route53_zone_id
  name    = local.app_domain_tripadvisor
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb.dns_name]
}
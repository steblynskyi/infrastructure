# EC2 Configuration
resource "aws_instance" "controller" {
  ami                     = var.iam_image
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = var.public_subnet_ids
  vpc_security_group_ids  = var.security_group_ids_ec2
  availability_zone       = "us-east-1a"
  iam_instance_profile    = data.aws_iam_instance_profile.ec2_instance_profile.name
  user_data = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.prod"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=prod"
    })
  )

  disable_api_termination = true

  root_block_device {
    volume_type           = "gp2"
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

  associate_public_ip_address = true

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
    Domain      = local.app_domain
  }
}

# Create EBS Volume
resource "aws_ebs_volume" "this" {
  availability_zone = aws_instance.controller.availability_zone
  size              = 100
  type              = "gp3"

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

# EBS Volume Attachment
resource "aws_volume_attachment" "this" {
  device_name = "xvdb"
  volume_id   = aws_ebs_volume.this.id
  instance_id = aws_instance.controller.id
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id    = var.route53_zone_id
  name       = local.app_domain
  type       = "A"
  ttl        = "300"
  records    = [aws_instance.controller.public_ip]
  depends_on = [aws_instance.controller]
}
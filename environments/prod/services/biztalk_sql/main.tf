# EC2 Configuration
resource "aws_instance" "biztalk_sql" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = var.ec2_private_subnet_id
  vpc_security_group_ids  = var.security_group_ids_ec2
  iam_instance_profile    = data.aws_iam_instance_profile.ec2_instance_profile.name
  disable_api_termination = true

  user_data = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.local"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=local"
    })
  )

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

  associate_public_ip_address = false

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
    Application = local.app_env
    Domain      = local.app_domain
  }
}

# Create EBS Volume 1
resource "aws_ebs_volume" "this_1" {
  availability_zone = aws_instance.biztalk_sql.availability_zone
  size              = 200
  type              = "gp2"

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
  instance_id = aws_instance.biztalk_sql.id
}

# Create EBS Volume 2
resource "aws_ebs_volume" "this_2" {
  availability_zone = aws_instance.biztalk_sql.availability_zone
  size              = 200
  type              = "gp2"

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

# EBS Volume Attachment Volume 2
resource "aws_volume_attachment" "volume_2" {
  device_name = "xvdc"
  volume_id   = aws_ebs_volume.this_2.id
  instance_id = aws_instance.biztalk_sql.id
}

# Create EBS Volume 3
resource "aws_ebs_volume" "this_3" {
  availability_zone = aws_instance.biztalk_sql.availability_zone
  size              = 100
  type              = "gp2"

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

# EBS Volume Attachment Volume 3
resource "aws_volume_attachment" "volume_3" {
  device_name = "xvdf"
  volume_id   = aws_ebs_volume.this_3.id
  instance_id = aws_instance.biztalk_sql.id
}

# Create EBS Volume 4
resource "aws_ebs_volume" "this_4" {
  availability_zone = aws_instance.biztalk_sql.availability_zone
  size              = 100
  type              = "gp2"

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

# EBS Volume Attachment Volume 4
resource "aws_volume_attachment" "volume_4" {
  device_name = "xvdg"
  volume_id   = aws_ebs_volume.this_4.id
  instance_id = aws_instance.biztalk_sql.id
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_instance.biztalk_sql.private_dns]
}
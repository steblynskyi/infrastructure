# EC2 Configuration
resource "aws_instance" "this" {
  ami                     = var.iam_image
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = var.private_subnet_ids
  vpc_security_group_ids  = var.security_group_ids_ec2
  private_ip              = var.network_private_ip
  availability_zone       = var.availability_zone
  iam_instance_profile    = data.aws_iam_instance_profile.ec2_instance_profile.name
  user_data               = file("user_data.txt")
  disable_api_termination = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "150"
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
  }
}
# EC2 Configuration
resource "aws_instance" "this" {
  ami                    = var.iam_image
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.private_subnet_ids
  vpc_security_group_ids = var.security_group_ids_ec2
  iam_instance_profile   = data.aws_iam_instance_profile.ec2_instance_profile.name

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "100"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = false

  tags = {
    Name        = "${var.ec2_name}-${var.environment}"
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}
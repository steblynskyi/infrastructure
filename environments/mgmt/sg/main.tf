# Managment Access SG
resource "aws_security_group" "manage" {
  name        = "Manager-Mgmt"
  description = var.description
  vpc_id      = data.aws_vpc.Mgmt-VPC.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.Mgmt-VPC.cidr_block, "10.70.0.0/16", "10.30.0.0/16", "10.10.0.0/16", "10.95.0.0/16"]
  }
  egress {
    description      = "All protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Access      = "All protocols"
    Name        = "Manager-Mgmt"
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}

# LB SG
resource "aws_security_group" "lb-sg" {
  name        = "LB-HTTP-HTTPS-Mgmgt"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)(IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.Mgmt-VPC.id

  ingress {
    description = "HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "All protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Access    = "HTTP and HTTPS Only"
    Name      = "LB-HTTP-HTTPS-Mgmt-VPC"
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}

# EC2 SG for Jenkins Master
resource "aws_security_group" "jenkins_master" {
  name        = "Jenkins-Master-Mgmt-VPC"
  description = "Security group for EC2 Jenkins Master"
  vpc_id      = data.aws_vpc.Mgmt-VPC.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.Mgmt-VPC.cidr_block]
  }

  egress {
    description      = "All protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Access    = "All protocols"
    Name      = "Jenkins-Master-Mgmt-VPC"
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}

# LB SG for Jenkins Master
resource "aws_security_group" "lb_https_jnlp" {
  name        = "LB-HTTPS-JNLP-Mgmt-VPC"
  description = "Security group for HTTPS and Custom TCP 49187 port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.Mgmt-VPC.id

  ingress {
    description = "JNLP"
    from_port   = 49187
    protocol    = "tcp"
    to_port     = 49187
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "All protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Access    = "HTTPS and Custom TCP 49187 Only"
    Name      = "LB-HTTPS-JNLP-Mgmt-VPC"
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}
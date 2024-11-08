# HTTP SG
resource "aws_security_group" "http" {
  name        = "HTTP-ALL-PROD"
  description = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
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
    Access    = "HTTP Only"
    Name      = "HTTP-ALL-PROD"
    Terraform = "True"
  }
}

# HTTPS SG
resource "aws_security_group" "https" {
  name        = "HTTPS-ALL-PROD"
  description = "Security group with HTTPS ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS Only"
    Name      = "HTTPS-ALL-PROD"
    Terraform = "True"
  }
}

# LB SG
resource "aws_security_group" "lb-http" {
  name        = "LB-HTTP-HTTPS-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)(IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.selected.id

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
    Name      = "LB-HTTP-HTTPS-PROD"
    Terraform = "True"
  }
}

# Scheduling Service
resource "aws_security_group" "Scheduling-Service-PROD" {
  name        = "Scheduling-Service-PROD"
  description = "Security group with TCP 555 port open for everybody"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "Scheduling Service"
    from_port   = 555
    protocol    = "tcp"
    to_port     = 555
    cidr_blocks = [data.aws_vpc.selected.cidr_block, "158.106.208.174/32", "69.38.138.162/32"]
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
    Access    = "TCP 555 Port Only"
    Name      = "Scheduling-Service-PROD"
    Terraform = "True"
  }
}

# BE Ingress SG Kubernates
resource "aws_security_group" "be-ingress" {
  name        = "BE-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "BE-Ingress-PROD"
    Terraform = "True"
  }
}

# IDENTITY Ingress SG Kubernates
resource "aws_security_group" "identity-ingress" {
  name        = "Identity-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "Identity-Ingress-PROD"
    Terraform = "True"
  }
}

# OTA Ingress SG Kubernates
resource "aws_security_group" "ota-ingress" {
  name        = "OTA-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS, HTTP and Rabbit-MQ Only"
    Name      = "OTA-Ingress-PROD"
    Terraform = "True"
  }
}

# PC Ingress SG Kubernates
resource "aws_security_group" "pc-ingress" {
  name        = "PC-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "PC-Ingress-PROD"
    Terraform = "True"
  }
}

# PMS Ingress SG Kubernates
resource "aws_security_group" "pms-ingress" {
  name        = "PMS-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "PMS-Ingress-PROD"
    Terraform = "True"
  }
}

# Support Ingress SG Kubernates
resource "aws_security_group" "support-ingress" {
  name        = "Support-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "Support-Ingress-PROD"
    Terraform = "True"
  }
}

# Payments Ingress SG Kubernates
resource "aws_security_group" "payments-ingress" {
  name        = "Payments-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "Payments-Ingress-PROD"
    Terraform = "True"
  }
}

# OPS Ingress SG Kubernates
resource "aws_security_group" "ops-ingress" {
  name        = "OPS-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "OPS-Ingress-PROD"
    Terraform = "True"
  }
}

# Utils Ingress SG Kubernates
resource "aws_security_group" "utils-ingress" {
  name        = "Utils-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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

  ingress {
    description = "Fluent"
    from_port   = 24224
    protocol    = "tcp"
    to_port     = 24224
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
    Access    = "HTTPS, HTTP and TCP 24224 Only"
    Name      = "Utils-Ingress-PROD"
    Terraform = "True"
  }
}

# Redis SG
resource "aws_security_group" "redis" {
  name        = "Redis-SG-PROD"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "Redis"
    from_port   = 6379
    protocol    = "tcp"
    to_port     = 6379
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
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
    Access    = "HTTPS and HTTP Only"
    Name      = "Redis-SG-PROD"
    Terraform = "True"
  }
}

# RDS SG
resource "aws_security_group" "RDS" {
  name        = "RDS-SG-PROD"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "MSSQL Server"
    from_port   = 1433
    protocol    = "tcp"
    to_port     = 1433
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "MySQL/Aurora"
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
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
    Access    = "HTTPS and HTTP Only"
    Name      = "RDS-SG-PROD"
    Terraform = "True"
  }
}

# MongoDB SG
resource "aws_security_group" "mongodb" {
  name        = "Mongodb-SG-PROD"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "MongoDB"
    from_port   = 27017
    protocol    = "tcp"
    to_port     = 27017
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
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
    Access    = "HTTPS and HTTP Only"
    Name      = "Mongodb-SG-PROD"
    Terraform = "True"
  }
}

# Default Lambda SG
resource "aws_security_group" "lambda" {
  name        = "Default-Lambda-SG-PROD"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
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
    Name      = "Default-Lambda-SG-PROD"
    Terraform = "True"
  }
}

# Biztalk SG
resource "aws_security_group" "biztalk" {
  name        = "Biztalk-SG-PROD"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "HTTP 8080"
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "Remote Desktop"
    from_port   = 3389
    protocol    = "tcp"
    to_port     = 3389
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "MSSQL Server"
    from_port   = 1433
    protocol    = "tcp"
    to_port     = 1433
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
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
    Name      = "Biztalk-SG-PROD"
    Terraform = "True"
  }
}

# Managment Access SG
resource "aws_security_group" "manage" {
  name        = "ManagerSG-PROD"
  description = "Security group to allow access to DevOps via SSH, RDP etc.."
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.selected.cidr_block, "24.228.163.208/32", "67.80.152.15/32", "24.115.175.114/32", "24.186.173.34/32", "24.186.175.209/32"]
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
    Name      = "ManagerSG-PROD"
    Terraform = "True"
  }
}

resource "aws_security_group" "elastic_search" {
  name        = "ElasticSearch-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)(IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTP and HTTPS"
    Name      = "ElasticSearch-PROD"
    Terraform = "True"
  }
}


resource "aws_security_group" "fileserver_sg" {
  name        = "FileServer-PROD"
  description = "Security group with for FileServer ingress from VPC CIDR, egress ports are all world open"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
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
    Access    = "FileServer"
    Name      = "FileServer-PROD"
    Terraform = "True"
  }
}

# WorkSpace SG
resource "aws_security_group" "workspace" {
  name        = "WorkSpace-PROD"
  description = "Security group with RDP port open for all world"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "RDP Access"
    from_port   = 3389
    protocol    = "tcp"
    to_port     = 3389
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
    Access    = "RDP Only"
    Name      = "WorkSpace-PROD"
    Terraform = "True"
  }
}

# PCI Access SG
resource "aws_security_group" "pci_access" {
  name        = "PCI-PROD"
  description = "Security group to allow access to PCI via RDP"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "RDP for PCI Access"
    from_port   = 3389
    protocol    = "tcp"
    to_port     = 3389
    cidr_blocks = ["45.127.122.86/32", "180.151.253.114/32"]
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
    Access    = "RDP protocols"
    Name      = "PCI-PROD"
    Terraform = "True"
  }
}

# Observability Ingress SG Kubernates
resource "aws_security_group" "observability-ingress" {
  name        = "Observability-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "Observability-Ingress-PROD"
    Terraform = "True"
  }
}

# Integrations Ingress SG Kubernates
resource "aws_security_group" "integrations-ingress" {
  name        = "Integrations-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "Integrations-Ingress-PROD"
    Terraform = "True"
  }
}

# Integrations Ingress SG Kubernates
resource "aws_security_group" "b2b-ingress" {
  name        = "B2B-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "B2B-Ingress-PROD"
    Terraform = "True"
  }
}

# Support Kafka SG Kubernates
resource "aws_security_group" "kafka-ingress" {
  name        = "Kafka-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "Kafka-Ingress-PROD"
    Terraform = "True"
  }
}

# ENVOPS Ingress SG Kubernates
resource "aws_security_group" "envops-ingress" {
  name        = "ENVOPS-Ingress-PROD"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.selected.id

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
    Access    = "HTTPS and HTTP Only"
    Name      = "ENVOPS-Ingress-PROD"
    Terraform = "True"
  }
}
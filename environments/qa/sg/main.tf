# HTTP SG
resource "aws_security_group" "http" {
  name        = "HTTP-ALL-QA"
  description = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "HTTP-ALL-QA"
    Terraform = "True"
  }
}

# HTTPS SG
resource "aws_security_group" "https" {
  name        = "HTTPS-ALL-QA"
  description = "Security group with HTTPS ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "HTTPS-ALL-QA"
    Terraform = "True"
  }
}

# LB SG HTTP
resource "aws_security_group" "lb-http" {
  name        = "LB-HTTP-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)(IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "LB-HTTP-QA"
    Terraform = "True"
  }
}

# LB SG HTTPS
resource "aws_security_group" "lb-https" {
  name        = "LB-HTTPS-HTTP-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "LB-HTTPS-HTTP-QA"
    Terraform = "True"
  }
}

# Scheduling Service
resource "aws_security_group" "scheduling-service" {
  name        = "Scheduling-Service-QA"
  description = "Security group with TCP 555 port open for everybody"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "Scheduling Service"
    from_port   = 555
    protocol    = "tcp"
    to_port     = 555
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block, "10.90.0.0/16", "10.95.0.0/16"]
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
    Name      = "Scheduling-Service-QA"
    Terraform = "True"
  }
}

# B2B Ingress SG Kubernates
resource "aws_security_group" "b2b-ingress" {
  name        = "B2B-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "B2B-Ingress-QA"
    Terraform = "True"
  }
}

# BE Ingress SG Kubernates
resource "aws_security_group" "be-ingress" {
  name        = "BE-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "BE-Ingress-QA"
    Terraform = "True"
  }
}

# IDENTITY Ingress SG Kubernates
resource "aws_security_group" "identity-ingress" {
  name        = "Identity-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "Identity-Ingress-QA"
    Terraform = "True"
  }
}

# OTA Ingress SG Kubernates
resource "aws_security_group" "ota-ingress" {
  name        = "OTA-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "OTA-Ingress-QA"
    Terraform = "True"
  }
}

# PC Ingress SG Kubernates
resource "aws_security_group" "pc-ingress" {
  name        = "PC-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "PC-Ingress-QA"
    Terraform = "True"
  }
}

# Kafka Ingress SG Kubernates
resource "aws_security_group" "kafka-ingress" {
  name        = "KAFKA-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    description = "Kafka"
    from_port   = 9092
    protocol    = "tcp"
    to_port     = 9092
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kafka-External"
    from_port   = 9094
    protocol    = "tcp"
    to_port     = 9094
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
    Name      = "KAFKA-Ingress-QA"
    Terraform = "True"
  }
}

# PMS Ingress SG Kubernates
resource "aws_security_group" "pms-ingress" {
  name        = "PMS-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "PMS-Ingress-QA"
    Terraform = "True"
  }
}

# Support Ingress SG Kubernates
resource "aws_security_group" "support-ingress" {
  name        = "Support-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "Support-Ingress-QA"
    Terraform = "True"
  }
}

# Payments Ingress SG Kubernates
resource "aws_security_group" "payments-ingress" {
  name        = "Payments-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "Payments-Ingress-QA"
    Terraform = "True"
  }
}

# OPS Ingress SG Kubernates
resource "aws_security_group" "ops-ingress" {
  name        = "OPS-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "OPS-Ingress-QA"
    Terraform = "True"
  }
}

# Utils Ingress SG Kubernates
resource "aws_security_group" "utils-ingress" {
  name        = "Utils-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    description = "Fluentbit for app"
    from_port   = 24224
    protocol    = "tcp"
    to_port     = 24224
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Fluentbit for audit logs"
    from_port   = 24225
    protocol    = "tcp"
    to_port     = 24225
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
    Name      = "Utils-Ingress-QA"
    Terraform = "True"
  }
}

# Monitoring Ingress SG Kubernates
resource "aws_security_group" "monitoring-ingress" {
  name        = "Monitoring-Ingress-QA"
  description = "Security group with HTTP,HTTPS and TCP port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
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
    description = "Prometheus"
    from_port   = 9100
    protocol    = "tcp"
    to_port     = 9100
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
    Access    = "HTTPS, HTTP and TCP 9100, 8080 Only"
    Name      = "Monitoring-Ingress-QA"
    Terraform = "True"
  }
}

# Redis SG
resource "aws_security_group" "redis" {
  name        = "Redis-SG-QA"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "Redis"
    from_port   = 6379
    protocol    = "tcp"
    to_port     = 6379
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
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
    Access    = "Custom TCP 6379"
    Name      = "Redis-SG-QA"
    Terraform = "True"
  }
}

# RDS SG
resource "aws_security_group" "rds" {
  name        = "RDS-SG-QA"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "MSSQL Server"
    from_port   = 1433
    protocol    = "tcp"
    to_port     = 1433
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
  }

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
  }

  ingress {
    description = "MySQL/Aurora"
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
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
    Access    = "RDS ports Only"
    Name      = "RDS-SG-QA"
    Terraform = "True"
  }
}



# Default Lambda SG
resource "aws_security_group" "lambda" {
  name        = "Default-Lambda-SG-QA"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
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
    Name      = "Default-Lambda-SG-QA"
    Terraform = "True"
  }
}

# Biztalk SG
resource "aws_security_group" "biztalk" {
  name        = "Biztalk-SG-QA"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
  }

  ingress {
    description = "HTTP 8080"
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
  }

  ingress {
    description = "Remote Desktop"
    from_port   = 3389
    protocol    = "tcp"
    to_port     = 3389
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
  }

  ingress {
    description = "MSSQL Server"
    from_port   = 1433
    protocol    = "tcp"
    to_port     = 1433
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
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
    Name      = "Biztalk-SG-QA"
    Terraform = "True"
  }
}

# ElasticSearch SG
resource "aws_security_group" "elasticsearch" {
  name        = "ElasticSearch-SG-QA"
  description = "Security Group managed by Terraform"
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block]
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
    Name      = "ElasticSearch-SG-QA"
    Terraform = "True"
  }
}

# Managment Access SG

resource "aws_security_group" "manage" {
  name        = "ManagerSG-QA"
  description = "Security group to allow access to QAOps via SSH, RDP etc.."
  vpc_id      = data.aws_vpc.QA-VPC.id

  ingress {
    description = "All protocols"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [data.aws_vpc.QA-VPC.cidr_block, "10.90.0.0/16", "10.95.0.0/16"]
  }

  ingress {
    description = ""
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
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
    Access    = "All protocols"
    Name      = "ManagerSG-QA"
    Terraform = "True"
  }

  lifecycle {
    ignore_changes = [
      ingress,
    ]
  }
}

# Observability Ingress SG Kubernates
resource "aws_security_group" "observability-ingress" {
  name        = "Observability-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "Observability-Ingress-QA"
    Terraform = "True"
  }
}

# Integrations Ingress SG Kubernates
resource "aws_security_group" "integrations-ingress" {
  name        = "Integrations-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "Integrations-Ingress-QA"
    Terraform = "True"
  }
}

# ENVOPS Ingress SG Kubernates
resource "aws_security_group" "envops-ingress" {
  name        = "ENVOPS-Ingress-QA"
  description = "Security group with HTTP and HTTPS port open for everybody (FOR LB use)"
  vpc_id      = data.aws_vpc.QA-VPC.id

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
    Name      = "ENVOPS-Ingress-QA"
    Terraform = "True"
  }
}

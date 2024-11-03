# Create KMS key to use for EKS cluster
resource "aws_kms_key" "eks_key" {
  description             = format("EKS KMS Key %s", var.cluster_name)
  deletion_window_in_days = 7
}

# KMS alias for EKS cluster key
resource "aws_kms_alias" "eks_alias" {
  name          = "alias/vault-eks-mgmt"
  target_key_id = aws_kms_key.eks_key.id
}

# AWS CloudWatch Logs for EKS
resource "aws_cloudwatch_log_group" "eks_logs" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 14
}

# Create EKS cluster
resource "aws_eks_cluster" "vault" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn
  enabled_cluster_log_types = [
    "api",
    "audit"
  ]
  version = var.kubernetes_version

  vpc_config {
    subnet_ids = concat(var.private_subnets, var.public_subnets)
    security_group_ids = [
      aws_security_group.eks_sg.id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true

  }

  kubernetes_network_config {
    service_ipv4_cidr = var.kubernetes_cidr
  }

  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = aws_kms_key.eks_key.arn
    }
  }

  timeouts {}

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
    Terraform   = "True"
  }

  depends_on = [
    aws_cloudwatch_log_group.eks_logs,
    aws_iam_role.eks_role,
    aws_kms_key.eks_key,
  ]
}

# addon -- coreDNS
resource "aws_eks_addon" "core_dns" {
  cluster_name      = aws_eks_cluster.vault.name
  addon_name        = "coredns"
  resolve_conflicts = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.eks_worker
  ]
}

# addon -- kube-proxy
resource "aws_eks_addon" "kube_proxy" {
  cluster_name      = aws_eks_cluster.vault.name
  addon_name        = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.eks_worker
  ]
}

# create security group for EKS cluster
resource "aws_security_group" "eks_sg" {
  name        = "Vault-EKS-Cluster-Mgmt"
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  vpc_id      = var.vpc_id

  egress {
    description      = "All protocols"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name      = "EKS-Cluster-SG-Mgmt"
    Terraform = "True"
  }
}

# security group rule for load balancer
resource "aws_security_group_rule" "eks_sg_lb_rule" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = var.lb_sg
  security_group_id        = aws_security_group.eks_sg.id
}
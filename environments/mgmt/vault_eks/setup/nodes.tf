resource "aws_eks_node_group" "eks_worker" {
  cluster_name  = aws_eks_cluster.us_access.name
  node_role_arn = aws_iam_role.eks_node_role.arn
  subnet_ids    = var.private_subnets

  node_group_name = var.node_group_name

  #  ami_type       = local.ami_type
  #  capacity_type  = local.capacity_type
  #  disk_size      = local.disk_size
  #  instance_types = local.instance_types

  launch_template {
    name    = aws_launch_template.eks_worker_lt.name
    version = aws_launch_template.eks_worker_lt.latest_version
  }

  scaling_config {
    desired_size = local.desired_size
    max_size     = local.max_size
    min_size     = local.min_size
  }

  lifecycle {
    create_before_destroy = true
  }

  update_config {
    max_unavailable = local.max_unavailable
  }

  timeouts {}

  labels = {
    role                 = var.node_group_name
    "eks/cluster-name"   = aws_eks_cluster.us_access.name
    "eks/nodegroup-name" = var.node_group_name
  }

  tags = {
    Name                                          = "EKS-Worker-US-Access"
    Environment                                   = var.environment
    Terraform                                     = "True"
    "eks/cluster-name"                            = aws_eks_cluster.us_access.name
    "eks/nodegroup-name"                          = var.node_group_name
    "eks/nodegroup-type"                          = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = aws_eks_cluster.us_access.name
  }

  depends_on = [
    aws_launch_template.eks_worker_lt,
    aws_iam_role_policy_attachment.aws_eks_worker_node_policy,
    aws_iam_role_policy_attachment.aws_eks_cni_policy,
    aws_iam_role_policy_attachment.aws_ec2_container_registry_readonly,
    aws_eks_cluster.us_access,
    kubernetes_config_map.aws-auth
  ]
}

# Launch template for EKS worker nodes
resource "aws_launch_template" "eks_worker_lt" {
  name          = format("eks-worker-ln-%s", data.aws_eks_cluster.cluster.name)
  instance_type = local.instance_types[0]
  key_name      = "linux-admin"
  #  image_id      = data.aws_ssm_parameter.eksami.value
  #  user_data = base64encode(local.eks-node-private-userdata)
  vpc_security_group_ids = [
    data.aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id,
    aws_security_group.eks_sg.id
  ]

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = local.disk_size
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name                                          = "EKS-Worker-US-Access"
      Environment                                   = var.environment
      Terraform                                     = "True"
      "eks/cluster-name"                            = aws_eks_cluster.us_access.name
      "eks/nodegroup-name"                          = var.node_group_name
      "eks/nodegroup-type"                          = "managed"
      "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = aws_eks_cluster.us_access.name
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "v19.7.0"

  cluster_name                   = local.cluster_name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = local.cluster_endpoint_public_access
  vpc_id                         = local.vpc_id
  subnet_ids                     = local.private_subnets
  control_plane_subnet_ids       = local.public_subnets


  cluster_addons = {
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      preserve    = true
      most_recent = true

      timeouts = {
        create = "25m"
        delete = "10m"
      }
    }
    vpc-cni = {
      most_recent = true
    }
  }

  # Extend cluster security group rules
  cluster_security_group_additional_rules = {
    ingress_source_security_group_id = {
      description              = "Ingress from another computed security group"
      protocol                 = -1
      from_port                = 0
      to_port                  = 0
      type                     = "ingress"
      source_security_group_id = local.additional_security_group_id
    }
  }

  eks_managed_node_group_defaults = {
    ami_type  = var.managed_node_group_ami_type
    disk_size = var.managed_node_group_disk_size
  }

  eks_managed_node_groups = {
    spot_nodes = {
      desired_size = var.managed_node_group_desired_size
      min_size     = var.managed_node_group_min_size
      max_size     = var.managed_node_group_max_size

      instance_types = var.managed_node_group_instance_types
      capacity_type  = var.managed_node_group_capacity_type
      labels = {
        NodeType = var.managed_node_group_capacity_type
      }
      tags = {
        NodeType = var.managed_node_group_capacity_type
      }

      use_custom_launch_template = false
      remote_access = {
        ec2_ssh_key = var.managed_node_group_remote_access_key
      }
    }
  }

  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = module.karpenter.role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes",
      ]
    },
  ]
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::960031658638:user/taras"
      username = "taras"
      groups   = ["system:masters"]
    }
  ]
}
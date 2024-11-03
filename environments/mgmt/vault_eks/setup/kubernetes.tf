provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

resource "kubernetes_config_map" "aws-auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = <<EOT
     - rolearn: ${aws_iam_role.eks_node_role.arn}
       username: system:node:{{EC2PrivateDNSName}}
       groups:
       - system:bootstrappers
       - system:nodes
     - rolearn: arn:aws:iam::123:role/OneLoginAdmin
       username: admin
       groups:
       - system:masters
    EOT
    mapUsers = <<EOT
     - username: taras
       userarn: arn:aws:iam::123:user/taras
       groups:
       - system:masters
    EOT
  }

  depends_on = [
    aws_iam_role.eks_node_role,
    aws_eks_cluster.us_access
  ]
}
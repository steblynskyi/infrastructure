
data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.vault.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.vault.id
}

data "aws_ssm_parameter" "eksami" {
  name = format("/aws/service/eks/optimized-ami/%s/amazon-linux-2/recommended/image_id", data.aws_eks_cluster.cluster.version)
}
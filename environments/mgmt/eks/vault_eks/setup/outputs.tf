// eks cluster
output "cluster_name" {
  value = aws_eks_cluster.vault.name
}

output "eks_node_group_name" {
  value = aws_eks_node_group.eks_worker.node_group_name
}

# eks kms key
output "kms_key_arn" {
  value = aws_kms_key.eks_key.arn
}

# Kubernetes certificate authority
output "k8s_ca_cert" {
  value = aws_eks_cluster.vault.certificate_authority[0].data
}

# EKS Endpoint
output "k8s_endpoint" {
  value = aws_eks_cluster.vault.endpoint
}

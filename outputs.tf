output "eks-cluster" {
  value = data.aws_eks_cluster.data_eks_cluster.endpoint
  sensitive = true
}

output "eks-cluster-auth" {
  value = data.aws_eks_cluster_auth.data_eks_cluster_auth.token
  sensitive = true
}

output "certificate-authority" {
  value = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  sensitive = true
}

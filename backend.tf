terraform {
  backend "remote" {
    organization = "vmoseng_certs"

    workspaces {
      name = "dev-eks-infra"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Collect EKS Token 
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "aws" {
  region = var.aws_region
  
  default_tags {
   tags = {
     # Technical 
     Application = "cloudNativeEKSCluster"
     Environment = "dev"
   }
 }
}
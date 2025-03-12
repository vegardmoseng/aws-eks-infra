data "aws_eks_cluster" "data_eks_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "data_eks_cluster_auth" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"

  cluster_version = var.eks_cluster_version
  cluster_name    = var.eks_cluster_name
  vpc_id          = module.vpc.vpc_id
  subnets         = [
    module.vpc.private_subnets[0], 
    module.vpc.private_subnets[1], 
    module.vpc.private_subnets[2]
  ]

  worker_groups = [
    {
      instance_type = "t3.large"
      asg_max_size  = 3
      asg_min_size  = 1
    }
  ]

  map_roles = [{
                rolearn  = var.eks_map_role_arn
                username = "cos-cluster-admin"
                groups   = ["system:masters"]
            }]
}
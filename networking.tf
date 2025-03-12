module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway     = var.vpc_enable_nat_gateway
  enable_vpn_gateway     = var.vpc_enable_vpn_gateway
  one_nat_gateway_per_az = var.vpc_one_nat_gateway_per_az
   
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/cn-cos-onboarding-ie-eks" = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/cn-cos-onboarding-ie-eks" = "owned"
  }
}
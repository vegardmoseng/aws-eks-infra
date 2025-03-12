# backend.tf
variable "aws_region" {
    type = string
}


# bastion.tf
variable "aws_instance_ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "instance_name" {
    type = string
}

variable "key_pair_name" {
    type = string
}

variable "key_pair_public_key" {
    type = string
}


# eks.tf
variable "eks_cluster_version" {
    type = string
}

variable "eks_cluster_name" {
    type = string
}

variable "eks_map_role_arn" {
    type = string
}


# iam.tf
variable "iam_role_name_AWSLoadBalancerControllerIAMPolicy" {
    type = string
}

variable "iam_role_id_AWSLoadBalancerControllerIAMPolicy" {
    type = string
}

variable "aws_account_number" {
    type = string
}

variable "iam_policy_name_AWSLoadBalancerControllerIAMPolicy" {
    type = string
}


# networking.tf 
variable "vpc_name" {
    type = string
}

variable "vpc_cidr" {
    type = string
}

variable "vpc_azs" {
    type = list(string)
}

variable "vpc_private_subnets" {
    type = list(string)
}

variable "vpc_public_subnets" {
    type = list(string)
}

variable "vpc_enable_nat_gateway" {
    type = bool 
}

variable "vpc_enable_vpn_gateway" {
    type = bool 
}

variable "vpc_one_nat_gateway_per_az" {
    type = bool
}


# oicd.tf 
variable "oicd_idp_config_name" {
    type = string
}


# security-groups.tf 
variable "ec2_jumpserver_sg_name" {
    type = string
}

variable "ec2_jumpserver_sg_ip_wlist" {
    type = list(string)
}
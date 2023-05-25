// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "aws_caller_identity" "current" {
}
locals {
  cluster_version = "1.23"
  name            = "bb-eks"
  tags = merge({
    env   = "sbx-bb"
    stack = "aws-eks-local"
    team  = "devops"
    }, {
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-modules"
  })
}
module "eks" {
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }
  cluster_endpoint_public_access = true
  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  eks_managed_node_groups = {
    mg_m5 = {
      instance_types = [
        "t3.medium",
      ]
      desired_size = 1
      max_size     = 2
      min_size     = 1
    }
  }
  enable_irsa = true
  source      = "terraform-aws-modules/eks/aws"
  subnet_ids  = data.terraform_remote_state.vpc.outputs.private_subnets
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
}

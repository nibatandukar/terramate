generate_hcl "_terramate_generated_data-source.tf" {
#  condition = global.isLocal == true

  content {

    data "terraform_remote_state" "vpc" {
      backend = "s3"

      config = {
                bucket         = "${global.aws_account}-terraform-remote-states"
                key            = "${global.aws_region}/vpc/terraform.tfstate"
                region = global.aws_region
      }

      defaults = {
        vpc_id          = "vpc-123456789"
        private_subnets = ["subnet-123456789"]
      }
    }
  }
}
/*
generate_hcl "_terramate_generated_data-source.tf" {
  condition = global.isLocal == false

  content {
    data "terraform_remote_state" "vpc" {
      backend = "remote"

      config = {
        organization = global.tfe_organization
        workspaces = {
          name = "aws-vpc-${global.environment}"
        }
      }

      defaults = {
        vpc_id          = "vpc-123456789"
        private_subnets = ["subnet-123456789"]
      }
    }
  }
}

*/

# Generate '_terramate_generated_eks.tf' in each stack
generate_hcl "_terramate_generated_eks.tf" {
  content {

    data "aws_caller_identity" "current" {}


    locals {
      name            = global.eks_cluster_name
      cluster_version = "1.23"


      tags = merge(global.tags,
        {
          GithubRepo = "terraform-aws-eks"
          GithubOrg  = "terraform-aws-modules"
      })
    }
   
    module "eks" {
       source = "terraform-aws-modules/eks/aws"

       # EKS CLUSTER
       cluster_version    = local.cluster_version
       cluster_name       = local.name
       vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
       subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets

       cluster_endpoint_public_access = true 
       enable_irsa = true
       cluster_addons = {
           coredns    = {}
           kube-proxy = {}
           vpc-cni    = {}
        }


       # EKS MANAGED NODE GROUPS

      eks_managed_node_groups = {
        mg_m5 = {
          instance_types  = global.mng_config.mg_m5.instance_types
          desired_size    = global.mng_config.mg_m5.desired_size
          max_size        = global.mng_config.mg_m5.max_size
          min_size        = global.mng_config.mg_m5.min_size
    }
  }
}

}
}

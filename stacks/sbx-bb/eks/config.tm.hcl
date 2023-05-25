globals {
  terraform_key = "${global.aws_region}/eks/terraform.tfstate"
  mng_config = {
    mg_m5 = {

      node_group_name = "managed-ondemand"

     # capacity_type  = "SPOT"
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

    #  update_config = {
    #    max_unavailable_percentage = 50
    #  }

      labels = {
        GithubRepo = "terraform-aws-eks"
        GithubOrg  = "terraform-aws-modules"
      }

      # block_device_mappings = {
      #   xvda = {
      #     ebs = {
      #       volume_size           = 50
      #       volume_type           = "gp3"
      #       iops                  = 150
      #       throughput            = 150
      #     }
      #   }
      # }

    }
  }
}

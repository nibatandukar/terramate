globals {
  aws_account = "berrybytes-sandbox"
  environment = "sbx-bb"

  name = "${global.environment}"
  terraform_key = "${global.terraform_key}"
  #region = "us-west-2"
  aws_region = "us-west-2"
  azs    = ["${global.aws_region}a", "${global.aws_region}b"]

  vpc_cidr_block  = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]

  eks_cluster_name = "bb-eks"


  tags = {
    env   = global.environment
    team  = "devops"
    stack = terramate.stack.id
  }

}
 

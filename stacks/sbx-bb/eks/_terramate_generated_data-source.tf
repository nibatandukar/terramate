// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "berrybytes-sandbox-terraform-remote-states"
    key    = "us-west-2/vpc/terraform.tfstate"
    region = "us-west-2"
  }
  defaults = {
    vpc_id = "vpc-123456789"
    private_subnets = [
      "subnet-123456789",
    ]
  }
}

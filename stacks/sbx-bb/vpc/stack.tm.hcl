stack {
  name = "AWS VPC Stack"
  id   = "aws-vpc-local"
}

globals {
  terraform_key = "${global.aws_region}/vpc/terraform.tfstate"
}


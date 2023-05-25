// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    acl            = "private"
    bucket         = "berrybytes-sandbox-terraform-remote-states"
    dynamodb_table = "berrybytes-sandbox-tflock"
    encrypt        = true
    key            = "us-west-2/eks/terraform.tfstate"
    profile        = "berrybytes-sandbox"
    region         = "us-west-2"
  }
}

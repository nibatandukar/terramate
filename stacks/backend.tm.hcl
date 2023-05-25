# Generate '_terramate_generated_backend.tf' in each stack for Local File-System
generate_hcl "_terramate_generated_backend.tf" {

  content {
    terraform {

      backend "s3" {
        region = global.aws_region
        dynamodb_table = "${global.aws_account}-tflock"
        bucket         = "${global.aws_account}-terraform-remote-states"
        acl            = "private"
        key            = global.terraform_key
        encrypt        = true
        profile        = global.aws_account
      }
    }
  }

}




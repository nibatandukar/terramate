globals {
  local_tfstate_path = "terraform.tfstate"

  terraform_version = "~> 1.3.7"

  terraform_aws_provider_region      = global.aws_region
  terraform_aws_provider_version     = "~> 4.34"
  terraform_k8s_provider_version     = "2.14.0"
  terraform_helm_provider_version    = "2.7.0"
  terraform_kubectl_provider_version = ">= 1.7.0"

  terraform_key = "default"
  # Terraform Cloud Configuration
 # tfe_organization = "adub-widgets"
 # tfe_workspace    = "${terramate.stack.id}"

}

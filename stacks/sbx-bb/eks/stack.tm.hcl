stack {
  name = "AWS Elastic Kubernetes Service Stack"
  id   = "aws-eks-local"

  after = [
    "/stacks/sbx-bb/vpc",
  ]
}

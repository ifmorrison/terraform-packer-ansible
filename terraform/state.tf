terraform {
backend "s3" {
bucket="tf-state-im"
key="terraform/dev/terraform_dev.tfstate"
region="eu-west-1"
}
}

terraform {
  required_version = ">= 0.12"

  backend "s3" {
    region  = "us-east-1"
    profile = "justin"
    bucket  = "jg-terraform-state-files"
    key     = "justingardner-com/dev/terraform.tfstate"
  }
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
}

provider "aws" {
  version = "~> 2.8"
  region  = var.aws_region
  profile = var.aws_profile
}

output "product" {
  value = local.product
}

output "tags" {
  value = local.tags
}

output "AWS_REGION" {
  value = var.aws_region
}

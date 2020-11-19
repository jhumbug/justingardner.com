# Name of the application. This value should usually match the application tag below.
variable "app" {
}

# the environment being created;
variable "environment" {
}

# source code repo
variable "repo" {
}

locals {
  tags = {
    application   = var.app
    environment   = var.environment
    repo          = var.repo
  }
}

# organization name that the repo is in
variable "github_organization" {}

# source code location
variable "github_repo" {}

variable "mx_records" {
  type = list(string)
}

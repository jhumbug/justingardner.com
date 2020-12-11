# Name of the application. This value should usually match the application tag below.
variable "app" {
}

# the environment being created;
variable "environment" {
}

# source code location
variable "repo" {
}

locals {
  product = "${var.app}-${var.environment}"

  tags = {
    application   = var.app
    environment   = var.environment
    product       = "${var.app}-${var.environment}"
    repo          = var.repo
  }
}


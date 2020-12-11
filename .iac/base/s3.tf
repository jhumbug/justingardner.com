# empty s3 bucket for site root - {domain}.com

variable "bucket_name" {}

resource "aws_s3_bucket" "site_root" {
  bucket = var.bucket_name
  acl    = "private"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

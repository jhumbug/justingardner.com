resource "aws_s3_bucket" "site" {
  bucket = var.app_domain_name
  acl    = "public-read"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[{
        "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
          "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.app_domain_name}/*"]
    }
  ]
}
EOF

  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}


module "cloudfront" {
  source = "../../modules/cloudfront"

  product         = local.product
  aliases         = [ var.app_domain_name ]
  cert_domain     = "justingardner.com"
  s3_origin       = aws_s3_bucket.site.bucket_regional_domain_name
}

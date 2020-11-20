variable "cert_domain" {}

data "aws_acm_certificate" "site_cert" {
  domain   = var.cert_domain
}

resource "aws_cloudfront_distribution" "site" {
  origin {
    domain_name = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id   = "${var.app}-${var.environment}"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "${var.app}-${var.environment}"
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  aliases = [
    var.app_domain_name
  ]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.site_cert.arn
    ssl_support_method  = "sni-only"
  }
}
output "CLOUDFRONT_DISTRIBUTION_ID" {
  value = aws_cloudfront_distribution.site.id
}

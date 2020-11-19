locals {
  domain_name = "justingardner.com"
}

resource "aws_route53_zone" "site" {
  name = local.domain_name
  tags = local.tags
}

# A record for {site}.com pointing to cloudfront
resource "aws_route53_record" "site_a" {
  zone_id = aws_route53_zone.site.zone_id
  name    = aws_route53_zone.site.name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "site_mx" {
  zone_id = aws_route53_zone.site.zone_id
  name    = aws_route53_zone.site.name
  type    = "MX"
  ttl     = 300
  records = var.mx_records
}

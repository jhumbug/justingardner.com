# hosted zone with mx records

locals {
  domain_name = "justingardner.com"
}

resource "aws_route53_zone" "site" {
  name = local.domain_name
  tags = local.tags
}

resource "aws_route53_record" "site_mx" {
  zone_id = aws_route53_zone.site.zone_id
  name    = aws_route53_zone.site.name
  type    = "MX"
  ttl     = 300
  records = var.mx_records
}

data "aws_route53_zone" "site" {
  name = "justingardner.com"
}

variable "app_domain_name" {}

resource "aws_route53_record" "app_alias_record" {
  zone_id = data.aws_route53_zone.site.zone_id
  name    = var.app_domain_name
  type    = "A"

  alias {
    name                   = module.cloudfront.domain_name
    zone_id                = module.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}

output "dns_fqdn" {
  value = aws_route53_record.app_alias_record.fqdn
}

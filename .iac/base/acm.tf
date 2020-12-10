
# ssl certs for {site}.com and *.{site}.com

resource "aws_acm_certificate" "site_cert" {
  domain_name               = local.domain_name
  subject_alternative_names = ["*.${local.domain_name}"]
  tags                      = local.tags
  validation_method         = "DNS"
}

resource "aws_route53_record" "site_cert_record" {
  name    = aws_acm_certificate.site_cert.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.site_cert.domain_validation_options.0.resource_record_type
  zone_id = aws_route53_zone.site.zone_id
  records = [aws_acm_certificate.site_cert.domain_validation_options.0.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "site_cert_validation" {
  certificate_arn         = aws_acm_certificate.site_cert.arn
  validation_record_fqdns = [aws_route53_record.site_cert_record.fqdn]
}

output "ACM_CERT_ARN" {
  value = aws_acm_certificate.site_cert.arn
}

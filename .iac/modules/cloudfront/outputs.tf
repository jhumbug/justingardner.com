output "distribution_id" {
  value = aws_cloudfront_distribution.site.id
}

output "domain_name" {
  value = aws_cloudfront_distribution.site.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.site.hosted_zone_id
}

output "origin_access_identity" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
}

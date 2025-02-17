resource "aws_route53_zone" "ajalah_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "ajalah_a_record" {
  zone_id = aws_route53_zone.ajalah_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.ajalah_cdn.domain_name
    zone_id                = aws_cloudfront_distribution.ajalah_cdn.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "ajalah_cname" {
  zone_id = aws_route53_zone.ajalah_zone.zone_id
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.domain_name]
}

resource "aws_acm_certificate" "ajalah_cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  subject_alternative_names = ["www.${var.domain_name}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.ajalah_cert.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.ajalah_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "cert_validate" {
  certificate_arn         = aws_acm_certificate.ajalah_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

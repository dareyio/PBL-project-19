# The entire section create a certiface, public zone, and validate the certificate using DNS method

# Create the certificate using a wildcard for all the domains created in david.toolingabby.com
resource "aws_acm_certificate" "project_19_cert" {
  domain_name       = "*.david.toolingabby.com"
  validation_method = "DNS"
}

# calling the hosted zone
data "aws_route53_zone" "project_19_zone" {
  name         = "david.toolingabby.com"
  private_zone = false
}

# selecting validation method
resource "aws_route53_record" "project_19_record" {
  for_each = {
    for dvo in aws_acm_certificate.project_19_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.project_19_zone.zone_id
}

# validate the certificate through DNS method
resource "aws_acm_certificate_validation" "project_19_validation" {
  certificate_arn         = aws_acm_certificate.project_19_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.project_19_record : record.fqdn]
}

# create records for tooling
resource "aws_route53_record" "tooling" {
  zone_id = data.aws_route53_zone.project_19_zone.zone_id
  name    = "tooling.david.toolingabby.com"
  type    = "A"

  alias {
    name                   = aws_lb.ext-alb.dns_name
    zone_id                = aws_lb.ext-alb.zone_id
    evaluate_target_health = true
  }
}


# create records for wordpress
resource "aws_route53_record" "wordpress" {
  zone_id = data.aws_route53_zone.project_19_zone.zone_id
  name    = "wordpress.david.toolingabby.com"
  type    = "A"

  alias {
    name                   = aws_lb.ext-alb.dns_name
    zone_id                = aws_lb.ext-alb.zone_id
    evaluate_target_health = true
  }
}

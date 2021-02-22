# SSL証明書作成
resource "aws_acm_certificate" "example" {
  domain_name               = aws_route53_record.example.name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# SSL証明書用の検証用レコード定義
resource "aws_route53_record" "example_certificate" {
  name    = tolist(aws_acm_certificate.example.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.example.domain_validation_options)[0].resource_record_type
  records = [tolist(aws_acm_certificate.example.domain_validation_options)[0].resource_record_value]
  zone_id = data.aws_route53_zone.example.id
  ttl     = 60
}

# SSL証明書検証完了待機
resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [aws_route53_record.example_certificate.fqdn]
}

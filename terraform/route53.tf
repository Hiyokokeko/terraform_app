# ドメイン名設定
# ホストゾーンの参照
data "aws_route53_zone" "example" {
  name = "example.com" # ここはあとで自分のドメインに
}
# ホストゾーンの作成
resource "aws_route53_zone" "test_example" {
  name = "test.example.com" # ここはあとで自分のドメインに
}

resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.example.zone_id
  name    = data.aws_route53_zone.example.name
  type    = "A"

  alias {
    name                   = aws_lb.example.dns_name
    zone_id                = aws_lb.example.zone_id
    evaluate_target_health = true
  }
}

# ドメイン名を出力
output "domain_name" {
  value = aws_route53_record.example.name
}

# ドメイン名設定
# ホストゾーンの参照
data "aws_route53_zone" "example" {
  name = "example.com" # ここはあとで自分のドメインに
}
# ホストゾーンの作成
resource "aws_route53_zone" "test_example" {
  name = "test.example.com" # ここはあとで自分のドメインに
}

# アカウントIDの出力
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# リージョンを出力
data "aws_region" "current" {}
output "region_name" {
  value = data.aws_region.current.name
}

# provider "aws" {
#   region = "ap-northeast-1"
# }

# data "aws_iam_policy_document" "allow_describe_regions" {
#   statement {
#     effect    = "Allow"
#     actions   = ["ec2:DescribeRegions"] # リージョン一覧を取得する
#     resources = ["*"]
#   }
# }

# # ここから下だけでいいのでは...

# module "describe_regions_for_ec2" {
#   source     = "./iam_role"
#   name       = "describe-regions-for-ec2"
#   identifier = "ec2.amazonaws.com"
#   policy     = data.aws_iam_policy_document.allow_describe_regions.json
# }

# ALBからS3へのアクセス権を設定するポリシードキュメント
data "aws_iam_policy_document" "alb_log" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.alb_log.id}/*"]

    principals {
      type        = "AWS"
      identifiers = ["582318560864"] #東京リージョンの固有ID
    }
  }
}

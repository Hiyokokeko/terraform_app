# プライベートバケット
resource "aws_s3_bucket" "private" {
  bucket = "private-pragmatic-terraform" # バケット名は一意制約よ

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# ブロックパブリックアクセス
resource "aws_s3_bucket_public_access_block" "private" {
  bucket                  = aws_s3_bucket.private.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# パブリックバケット
resource "aws_s3_bucket" "public" {
  bucket = "public-pragmatic-terraform"
  acl    = "public-read"

  cors_rule {
    allowed_origins = ["https://example.com"]
    allowed_methods = ["GET"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }
}

# ログバケット
resource "aws_s3_bucket" "alb_log" {
  bucket = "alb-log-pragmatic-terraform"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

## 本番環境用

### 2/22 terraform init
### 2/22 terraform apply テスト
### 2/22 terraform destroy エラー
Error: error deleting S3 Bucket (chinkibucker-alblog): BucketNotEmpty: The bucket you tried to delete is not empty
        status code: 409, request id: C51DEE3E7953A76B, host id: 1m4OKrhr55t/  seHsuCS1SsMbNwPYgtT/QzrXgbS9IqmW7PfRWnuzDakHWZJB7mkkjjDi2u96Ls8=

destroyでは作成したs3バケットの中身が消せなかったので、手動で空にしました。そしたら無事消せました。

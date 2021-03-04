## 本番環境用

## 以下メモ
### 2/22 terraform init
### 2/22 terraform apply テスト
### 2/22 terraform destroy エラー
Error: error deleting S3 Bucket (chinkibucker-alblog): BucketNotEmpty: The bucket you tried to delete is not empty
        status code: 409, request id: C51DEE3E7953A76B, host id: 1m4OKrhr55t/  seHsuCS1SsMbNwPYgtT/QzrXgbS9IqmW7PfRWnuzDakHWZJB7mkkjjDi2u96Ls8=

destroyでは作成したs3バケットの中身が消せなかったので、手動で空にしました。そしたら無事消せました。

### 2/27 terraform apply後にAWS CLIでパスワードの更新
AWSのIAMで使用権限付与した後にコマンド aws configureで設定<br>
コマンド aws ssm put-parameter --name '/db/password' --type SecureString --value 'ここにパスワード' --overwrite

### 2/27 バッチを更新したので再度applyし、CloudWatch Logsにてパスワードが登録されてるか確認
コマンド aws logs filter-log-events --log-group-name /ecs-scheduled-tasks/example

### 2/27 terraform destroy

### 3/4 terraform apply & destroy test ok
RDSとElastiCacheは重いのでまだテストできていない<br>
CodePipelineまではapplyは一応可能

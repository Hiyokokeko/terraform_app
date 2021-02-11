# パブリックのルートテーブル作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "public_route_table"
  }
}

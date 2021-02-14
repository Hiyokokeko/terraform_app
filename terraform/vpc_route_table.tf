# パブリックのルートテーブル作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "public_route_table"
  }
}

# インターネットゲートウェイとパブリックのルートテーブルを接続
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.example.id
  destination_cidr_block = "0.0.0.0/0"
}

# パブリックのルートテーブルにパブリックサブネットを割り当て
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# プライベートのルートテーブルにプライベートサブネット割り当て
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

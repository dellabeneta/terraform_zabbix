resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "dellops-zabbix-monitoramento"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = "dellops-zabbix-monitoramento"
  acl    = "private"
}

resource "aws_s3_object" "script_sh" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "script.sh"
  acl    = "public-read"
  source = "script.sh"
  etag   = filemd5("script.sh")
}
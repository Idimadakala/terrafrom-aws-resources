resource "aws_s3_bucket" "terraform-aws-s3" {
  bucket = var.bucket_name

  tags = merge(
    var.s3_tags,
    local.common_tags,
  {
    Name = "${var.project}-${var.environment}-s3"
  })
}
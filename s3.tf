resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-unique-bucket-shrutika"
}

resource "aws_s3_bucket_object" "my_object" {
  bucket = aws_s3_bucket.my_s3_bucket.bucket
  key    = "example.txt"
  source = "example.txt"
}

resource "aws_s3_bucket_policy" "my_s3_bucket_policy" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.my_s3_bucket.arn}/*"]
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

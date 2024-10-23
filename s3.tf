resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-unique-bucket-name"  # Ensure this name is globally unique
  tags = {
    Name = "My S3 Bucket"
  }
}

resource "aws_s3_bucket_acl" "my-s3-bucket-acl" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "my-s3-bucket-versioning" {
  bucket = aws_s3_bucket.my-s3-bucket.id

  versioning_configuration {
    status = "Enabled"  # Use "Enabled" or "Suspended"
  }
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "mydev-project-terraform-batch-25"  # Ensure this name is globally unique
  acl    = "private"

  tags = {
    Name = "My S3 Bucket"
  }
}

resource "aws_s3_bucket_versioning" "my-s3-bucket-versioning" {
  bucket = aws_s3_bucket.my-s3-bucket.id

  versioning_enabled = true
}


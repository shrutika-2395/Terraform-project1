resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-unique-bucket-name"  # Ensure this name is globally unique
  tags = {
    Name = "mydev-project-terraform-batch-25"
  }
}

resource "aws_s3_bucket_acl" "my-s3-bucket-acl" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "my-s3-bucket-versioning" {
  bucket = aws_s3_bucket.my-s3-bucket.id

  # Set the versioning status
  status = "Enabled"  # Use "Enabled" or "Suspended"
}


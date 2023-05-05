# S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "raj-tf-bucket-project"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_access" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowGetOnly",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ],
        "Resource" : [
          "${aws_s3_bucket.s3_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_s3_object" "s3_object" {
  bucket       = aws_s3_bucket.s3_bucket.id
  key          = "test-ssh-key.pem"
  source       = "~/Downloads/test-ssh-key.pem"
  content_type = "text/plain"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env_name}-${var.project}-bucket"

  server_side_encryption_configuration {
        rule {
            bucket_key_enabled = false

            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

  tags = {
    Name = "${var.env_name}-${var.project}-bucket"
    
  }
}
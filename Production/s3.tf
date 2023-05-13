resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env_name}-${var.project}-bucket"

  tags = {
    Name = "${var.env_name}-${var.project}-bucket"
    
  }
}
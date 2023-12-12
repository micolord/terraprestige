terraform {
  backend "s3" {
    bucket = "prod-prestige-state-bucket"
    region = "ap-southeast-1"
    key    = "state/"
  }
}
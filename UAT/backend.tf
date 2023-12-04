terraform {
  backend "s3" {
    bucket = "uat-prestige-state-bucket"
    region = "ap-southeast-1"
    key    = "state/"
  }
}
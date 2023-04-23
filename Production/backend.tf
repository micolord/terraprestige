terraform {
  backend "s3" {
    bucket = "mb-iac-states"
    region = "ap-southeast-1"
    key    = "state/"
  }
}
terraform {
  backend "s3" {
    bucket = "state-poc"
    region = "ap-southeast-1"
    key    = "state-poc/"
  }
}
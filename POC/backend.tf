terraform {
  backend "s3" {
    bucket = "state-test-poc"
    region = "ap-northeast-1"
    key    = "state-test-poc/"
  }
}
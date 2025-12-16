terraform {
  backend "s3" {
    bucket = "goalgraze-terraform-bucket"
    key ="goalgraze-terraform-bucket/terraform.tfstate"
    region = "eu-north-1"
    encrypt = true
  }
}

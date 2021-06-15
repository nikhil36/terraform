#Continuation from Chapter 3

provider "aws" {
    profile     = "terraform"
    region      = "us-east-1"   
}

resource "aws_s3_bucket" "terraform_course" {
    bucket = "my-private-bucket-20210610"
    acl    = "private"
    tags   = {
        "team" = "developers"
    }
  
}

resource "aws_default_vpc" "default" {
  
}
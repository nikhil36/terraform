resource "aws_s3_bucket" "terraform_course" {
    bucket = var.bucket_name
    acl    = var.acl
    
    tags   = {
        "team" = var.team,
        "terraform" = var.is_terraform
    } 
}
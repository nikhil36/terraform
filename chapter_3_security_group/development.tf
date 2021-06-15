#Continuation from Chapter 2

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


resource "aws_security_group" "web_security_group" {
    name        = "web_security_group"
    description = "Allow standard http and https ports inbound and outbound"

    ingress = [ {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Ingress route for tcp"
      from_port        = 80
      ipv6_cidr_blocks = ["0.0.0.0/0"]
      prefix_list_ids  = [ ]
      protocol         = "tcp"
      security_groups  = [ ]
      self = false
      to_port          = 80 
    }, 
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Ingress route for tcp"
      from_port        = 443
      ipv6_cidr_blocks = ["0.0.0.0/0"]
      prefix_list_ids  = [ ]
      protocol         = "tcp"
      security_groups  = [ ]
      self = false
      to_port          = 443 
    }]
    egress = [ {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Egress route"
      from_port        = 0
      ipv6_cidr_blocks = ["0.0.0.0/0"]
      prefix_list_ids  = [ ]
      protocol         = "-1"
      security_groups  = [ ]
      self = false
      to_port = 0
    } ]
    
    tags = {
      "Terraform" = "true"
    }

    
}



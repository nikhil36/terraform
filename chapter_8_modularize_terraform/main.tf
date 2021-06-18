#Continuation from Chapter 7

provider "aws" {
    profile     = "terraform"
    region      = "us-east-1"   
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
  
  is_terraform = "true"
  acl          = "private"
  team         = "developers"
  bucket_name  = "my-private-bucket-20210610" 
}

module "security_group" {
  source = "./modules/security_group"
  
  is_terraform          = "true"
  team                  = "developers"
  name                  = "web_security_group"
  description           = "Allow standard http and https ports inbound and outbound"

}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  
  is_terraform          = "true"
  instance_count        = 2
  team                  = "developers"
  ami                   = "ami-08845e76ce04d388e"
  instance_type         = "t2.nano"
  security_group_id     = module.security_group.web_security_group_id

}


resource "aws_eip_association" "development_web" {
  # Use `terraform show` to ge the static IP
  # Elastic IP association is changed and its using the array syntax now
  instance_id   = module.ec2_instance.ec2_instance_id[0]
  allocation_id = aws_eip.web_static_ip.id
  
}

resource "aws_eip" "web_static_ip" {
  tags = {
    "terraform" = "true"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"
  tags = {
    "terraform" = "true"
  }
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = "us-east-1b"
  tags = {
    "terraform" = "true"
  }
}

resource "aws_elb" "my_web_elb" {
    name      = "my-web-elb"

    instances       = module.ec2_instance.ec2_instance_id
    subnets         = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
    security_groups = [module.security_group.web_security_group_id]
    
    listener {
      instance_port     = 80
      instance_protocol = "http"
      lb_port           = 80
      lb_protocol       = "http"
    }
    
    tags = {
      "terraform" = "true"
    }


}
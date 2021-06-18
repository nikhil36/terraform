resource "aws_security_group" "web_security_group" {
    name        = var.name
    description = var.description

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
      "terraform" = var.is_terraform
      "team"      = var.team
    }

    
}

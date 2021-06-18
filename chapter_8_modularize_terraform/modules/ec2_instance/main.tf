resource "aws_instance" "this" {
  count          = var.instance_count

  ami            = var.ami
  instance_type  = var.instance_type
  vpc_security_group_ids = [
     var.security_group_id
  ]

  tags = {
      "terraform" = var.is_terraform
      "team"      = var.team
  }
}
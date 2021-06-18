output "ec2_instance_id" {
    value = tolist(aws_instance.this[*].id)
}
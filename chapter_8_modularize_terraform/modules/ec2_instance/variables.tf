variable "instance_count" {
    type = number
}

variable "team" {
    type = string
    default = "developers"
}

variable "is_terraform" {
    type = string
    default = "true"
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "security_group_id" {
    type = string
}


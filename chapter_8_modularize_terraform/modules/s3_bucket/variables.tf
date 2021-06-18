variable "bucket_name" {
    type = string
}

variable "team" {
    type = string
    default = "developers"
}

variable "is_terraform" {
    type = string
    default = "true"
}

variable "acl" {
    type = string
    default = "private"
}
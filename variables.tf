variable "name" {}

variable "region" {}

variable "kubernetes_version" {
    default = "1.21"
}

variable "desired_size" {
    default = 1
}

variable "max_size" {
    default = 2
}

variable "min_size" {
    default = 1
}

variable "disk_size" {
    default = 10
}

variable "instance_types" {
    default = [ "t3.small" ]
}

variable "environment" {}
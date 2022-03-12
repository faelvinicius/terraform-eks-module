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

#variable "disk_size" {
#    default = 10
#}

variable "instance_types" {
    default = "t3.small" 
}

variable "environment" {}

variable "ami_id" {
  description = "The AMI from which to launch the instance. If not supplied, EKS will use its own default image"
  type        = string
  default     = ""
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance(s) will be EBS-optimized"
  type        = bool
  default     = false
}


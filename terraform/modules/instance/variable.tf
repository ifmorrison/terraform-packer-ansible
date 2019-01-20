# Variables

variable "region" {
  default = "eu-west-1"
}

variable "vpc_id" {
  description = "VPC id"
  default     = ""
}

variable "subnet_public_id" {
  description = "VPC public subnet id"
  default     = ""
}

variable "security_group_ids" {
  description = "EC2 ssh security group"
  type        = "list"
  default     = []
}

variable "environment_tag" {
  description = "Environment tag"
  default     = ""
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default     = "lpkey"
}

variable "instance_ami" {
  description = "EC2 instance ami"
  default     = "ami-0e44e6cdc18ba9061"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

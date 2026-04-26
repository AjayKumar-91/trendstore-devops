variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "trend-eks-cluster"
}

variable "instance_type" {
  default = "t3.small"
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}
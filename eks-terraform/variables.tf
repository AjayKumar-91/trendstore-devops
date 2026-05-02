variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "trend-eks-cluster"
}

variable "instance_type" {
  default = "m7i-flex.large"
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
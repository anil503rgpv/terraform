variable "vpn_ip" {
  default = "0.0.0.0/0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "user_number" {
  type = number
  default = 1
}


variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}

variable "instance_type_list" {
  type = list
  default = ["t2.micro","t2.nano","t2.small"]
  
}

variable "instance_type_map" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-east-2 = "t2.nano"
    us-east-3 = "t2.small"

  }
  
}

variable "iam_elb_name" {
  type = list
  default = ["dev-loadbalance","stage-loadbalance","prod-loadbalance"]
}
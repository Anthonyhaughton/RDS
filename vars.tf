variable "instances" {
  type = map(object({
    ami           = string
    instance_type = string
    name = string
  }))
  default = {
    "instance1" = {
      ami           = "ami-079db87dc4c10ac91"
      instance_type = "t2.micro"
      name = "worker1"
    },
    "instance2" = {
      ami           = "ami-079db87dc4c10ac91"
      instance_type = "t2.micro"
      name = "worker2"
    }
  }
}

#variable "private_ips" {
#  type = list(string)
#  default = []
#}


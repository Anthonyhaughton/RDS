variable "vpc_cidr" {
  type = string
  default = "10.100.0.0/16"
  description = "CIDR for VPC"
}

variable "environment" {
  type = string
  default = "dev"
  description = "env"
}

variable "proj_name" {
  type = string
  default = "RDS"
  description = "Project Name"
}

variable "managed_by" {
  type = string
  default = "terraform"
  description = "Managed By"
}

variable "public_subnets_objects" {
  type = map(object({
    name = string
    cidr = string
    availability_zone = string
  }))
  default = {
    "subnet_a" = {
      name              = "us-east-1a",
      cidr              = "10.10.1.0/28"
      availability_zone = "us-east-1a"
    },
    "subnet_b" = {
      name              = "us-east-1b",
      cidr              = "10.10.2.0/28"
      availability_zone = "us-east-1b"
    }
  }
}

variable "private_subnets_objects" {
  type = map(object({
    name = string
    cidr = string
    availability_zone = string
  }))
  default = {
    "subnet_a" = {
      name              = "us-east-1a",
      cidr              = "10.10.3.0/28"
      availability_zone = "us-east-1a"
    },
    "subnet_b" = {
      name              = "us-east-1b",
      cidr              = "10.10.4.0/28"
      availability_zone = "us-east-1b"
    }
  }
}

variable "map_public_ip" {
  type = string
  default = "true"
  description = "Map IP on subnet creation or not"
}
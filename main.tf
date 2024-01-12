terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "vscode"
  shared_credentials_files = ["~/.aws/credentials"]
}

terraform {
  backend "s3" {
    bucket = "haughton-terraform-tfstate"
    key = "project-rds-state"
    region = "us-east-1"
  }
}

module "myvpc" {
  source = "./modules/vpc"
  environment = "dev"
}
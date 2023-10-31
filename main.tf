terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-08d70e59c07c61a3a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-09c08c3d3afaf078b"]
  subnet_id              = "subnet-0c049c746fa685e23"

  tags = {
    Name = var.instance_name
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = "minitato"
  acl    = "private"

  tags = {
    Name        = "s3-devops-test"
    Environment = "Dev"
  }

  provisioner "local-exec" {
    command = "echo $(date) >> codes/text1.txt && echo $(date) >> codes/text2.txt"
  }

  
}

resource "aws_s3_bucket_object" "upload" {

    for_each = fileset("codes/", "*")
    bucket = aws_s3_bucket.b.id
    key = each.value
    source = "codes/${each.value}"
    
}


# resource "aws_instance" "app_server" {
#   ami           = "ami-09e67e426f25ce0d7"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ec2-devops-test"
#   }
# }

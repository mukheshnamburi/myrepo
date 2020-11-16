terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "sample" {
  ami           = "ami-047b577fb036bfa95"
  instance_type = "t2.micro"
  key_name = "samplekey"

  tags = {
    "Name" = "ec2withkey"
  }

  user_data = <<EOF
              <powershell>
              net user nmukesh Asdf1234 /ADD /y
              net localgroup "Remote Desktop Users" "nmukesh" /add
              </powershell>
  EOF
      
}


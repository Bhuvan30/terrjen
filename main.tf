provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c944f0aa6a8ef089"  # Example AMI ID for eu-north-1 (update this to a valid AMI for your region)
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "example" {
  ami           = "ami-013ed6046abe69f0f"  # Your new valid AMI ID
  instance_type = "t3.micro"

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }
}

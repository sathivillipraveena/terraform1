terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }

backend "s3" {
    bucket = "secure-state-test"
    key    = "test" # cahnge key for every bucket we created 
    region = "us-east-1"
    encrypt        = true  # for state file locking when the file is executing 
    use_lockfile = true    # remote state file needs locking system when the terraform code is being changed 
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

/* # Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
} */
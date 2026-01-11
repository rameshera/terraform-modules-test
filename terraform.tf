terraform {
  #required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_version = ">= 1.14.3"   
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 6.28.0"
      # region = var.aws_region
    }
  }
    backend "s3" {
      bucket = "gavprofileactions25"
      key    = "vpc/terraform.tfstate"
      region = "us-east-1"
    }

  }


# Provider Block
provider "aws" {
  region = var.aws_region
  allowed_account_ids = [ "779563210855" ]

  assume_role {
    role_arn     = "arn:aws:iam::779563210855:role/terraform-admin-role"
    session_name = "terraform-session"
    
  }
}

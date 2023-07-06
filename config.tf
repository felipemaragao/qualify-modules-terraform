terraform {
  required_providers {
   
  aws = {
      source = "hashicorp/aws"
    }
  }
 
   backend "s3" {
    bucket = "qualify-terraform-state"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region  = "us-east-1"
  alias  = "east"
  profile = "DEV"

}

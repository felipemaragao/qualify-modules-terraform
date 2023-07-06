data "aws_ami" "ubuntu" {  
    most_recent = true
   
    owners = ["099720109477"] # Canonical

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

     filter {
        name = "virtualization-type"
        values = ["hvm"]
    }


}

data "aws_vpc" "main" {
    state = "available"

    filter {
        name = "tag:Name"
        values = ["RDS"]
    }
}

data "aws_subnets" "main" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}


# data "aws_security_group" "main" {
#   vpc_id = data.aws_vpc.main.id
#    tags = {
#     VPC = "vpc-${terraform.workspace}-${local.subnet_tier}-${local.az}"
#   }
# }


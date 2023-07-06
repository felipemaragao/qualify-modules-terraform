locals{

    hostname = var.name
    domainName = "advocato.com.br"
    subnet_tier = "private"
    az = "us-west-2a"
    record_type = "A"
    record_ttl = 10
   
    region = {
        "production" = "us-east-1"
        "homologation" = "us-east-2"
        "dev" = "us-west-1"
    }
  
    type= {
       banco= {

      instance_type = "t2.micro"
      root_block_device_delete_on_termination= true
      root_block_device_volume_size = 8
      root_block_device_volume_type = "gp2"

             sg_group_rule = {
                postgres = {
                    cidr_blocks = ["0.0.0.0/0"]
                    port = "5432"
                    protocol = "tcp"
                }
            }

    }
      web= {
      instance_type = "t2.micro"
      root_block_device_delete_on_termination= true
      root_block_device_volume_size = 8
      root_block_device_volume_type = "gp2"

             sg_group_rule = {
                http = {
                    cidr_blocks = ["0.0.0.0/0"]
                    port = "80"
                    protocol = "tcp"
                },
                https = {
                    cidr_blocks = ["0.0.0.0/0"]
                    port = "443"
                    protocol = "tcp"
                }
            }

        }
    }

}
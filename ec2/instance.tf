resource "aws_instance" "main" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = local.type[var.type].instance_type
  # relaciona com security group já existente
  # vpc_security_group_ids = ["${data.aws_security_group.main.id}"]
  # relaciona com o security criado
  # vpc_security_group_ids = ["${aws_security_group.main.id}"]
  subnet_id = tolist(data.aws_subnets.main.ids)[0]

  root_block_device {
   volume_type = local.type[var.type].root_block_device_volume_type
   volume_size = local.type[var.type].root_block_device_volume_size
   delete_on_termination = local.type[var.type].root_block_device_delete_on_termination

   tags = {
    instance = local.hostname
   }
  }

# ignore create new infra with pipeline execution
  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

  tags = {
    Name = local.hostname
  }
  
  # execute commmand on create infra
  user_data =<<EOF
  #!/bin/bash
  sudo hostnamectl set-hostname ${local.hostname}.${local.domainName}
  EOF
}




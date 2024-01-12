resource "aws_instance" "pub_instance" {
  for_each = var.instances

  ami           = each.value.ami
  instance_type = each.value.instance_type

  network_interface {
    for_each = {
      for idx, subnet_id in module.myvpc.public_subnet_ids : idx => {
        subnet_id = subnet_id
      }
    }
}

  tags = {
    Name = each.value.name
  }
}

resource "aws_network_interface" "interface" {
  for_each  = toset(module.myvpc.public_subnet_ids)
  subnet_id = each.key
}



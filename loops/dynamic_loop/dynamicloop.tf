resource "aws_instance" "roboshop" {
  count                  = length(var.tags)
  ami                    = var.ami
  instance_type          = var.instance_type #I have commented the instance type in variable.tf so it throws error
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = var.tags[count.index]
    #   name of the instance
  }
}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description


  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = var.cidr_block
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_block
    ipv6_cidr_blocks = var.ipv6_cidr_block
  }

  tags = {
    Name = var.sg_tags
  }
}



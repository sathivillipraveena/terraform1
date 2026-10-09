resource "aws_instance" "roboshop" {
    ami           = var.ami
    instance_type = lookup(var.instance_type, terraform.workspace, "t3.micro")
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = var.tags 
    #   name of the instance
}
}


resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        ipv6_cidr_blocks = var.ipv6_cidr_block
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



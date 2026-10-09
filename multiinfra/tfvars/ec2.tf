resource "aws_instance" "roboshop" {
    count = length(var.instances)
    ami           = var.ami
     #I have commented the instance type in variable.tf so it throws error
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = merge(
        var.common_tags ,  {
        component = var.instances[count.index]
        name = var.instances[count.index]
        }
        )
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

    tags = merge(
       var.sg_tags, {
        component = var.instances[count.index]
        name = var.instances[count.index
        ]
       }
    )
}











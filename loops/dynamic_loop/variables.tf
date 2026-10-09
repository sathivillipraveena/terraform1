variable "ami" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  description = "select instance type"
  default     = "t3.micro"

}

variable "tags" {
  type    = list(string)
  default = ["mongodb", "rabbitmq", "redis", "mysql"]
}

/* variable "tags" {
    type = map(string)
    default = {
        "mongodb"  = "t3.micro"
        "rabbitmq" = "t3.micro"
        "redis"    = "t3.micro"
        "mysql"    = "t3.micro"
        }
}
 */

variable "sg_name" {
  type    = string
  default = "allow-all"
}

variable "sg_description" {
  type    = string
  default = "allow all traffic to both inbound and out bound"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_block" {
  type    = list(string)
  default = ["::/0"]
}



variable "sg_tags" {
  type    = string
  default = "Allow_All"
}

variable "ingress_ports" {
  default = [ # list(map)
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
    },
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
    },
    {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
    },
    {
      from_port = 3306
      to_port   = 3306
      protocol  = "tcp"
    }
  ]
}
variable "ami" {
    type        = string
    description = "EC2 instance type for the web server"
    default     = "ami-0220d79f3f480ecf5"
}


variable "tags"{
    type        = string
    description = "name of the instance"
    default = "Hello world"
}

variable "sg_name" {
    type = string
    default = "allow-all"
}

variable "sg_description" {
    type = string
    default = "allow all traffic to both inbound and out bound"
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    default = 0
}

variable "cidr_block" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_block" {
    type = list(string)
    default = ["::/0"]
}



variable "sg_tags"{
    type        = string
    default = "Allow_All"
}

variable "instance_type"{
    type        = map(string)
    default = {
        dev="t3.micro"
        prod="t2.micro"
    }

}

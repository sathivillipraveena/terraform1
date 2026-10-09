resource "aws_route53_record" "roboticgear" {
  count   = length(var.tags)
  zone_id = var.zone_id
  name    = "${var.tags[count.index]}.roboticgear.shop" #name of the record 
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip] #store the private ip address of the mongodb instance
}

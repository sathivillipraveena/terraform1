resource "aws_route53_record" "mongodb" {
  zone_id = "Z096607625SAROAU2N8QT"
  name    = "${var.tags[count.index]}.roboticgear.shop" #name of the record 
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop.private_ip] #store the private ip address of the mongodb instance
}
resource "aws_route53_record" "zaws_online" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.zone_name}"
  type    = var.type
  ttl     = var.ttl
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}
resource "aws_route53_record" "zaws_online" {
  for_each = aws_instance.terraform
  zone_id = var.zone_id
  name    = "${each.key}.${var.zone_name}"
  type    = var.type
  ttl     = var.ttl
  records = [each.value.private_ip]
  allow_overwrite = true
}
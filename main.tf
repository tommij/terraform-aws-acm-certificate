resource "aws_acm_certificate" "certificate" {
  domain_name       = "${var.domain_name}"
  validation_method = "${var.validation_method}"
  tags              = "${var.tags}"
}

resource "aws_route53_record" "cert_validation" {
  name    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.zone.id}"
  records = ["${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
  count   = "${var.validation_method == "DNS" ? 1 : 0}"
}

resource "aws_acm_certificate_validation" "dns_validation" {
  certificate_arn         = "${aws_acm_certificate.certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
  count                   = "${var.validation_method == "DNS" ? 1 : 0}"
}

resource "aws_acm_certificate_validation" "email_validation" {
  certificate_arn = "${aws_acm_certificate.certificate.arn}"
  count           = "${var.validation_method == "EMAIL" ? 1 : 0}"
}

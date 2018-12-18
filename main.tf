resource "aws_acm_certificate" "this" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"
  subject_alternative_names = "${local.san_fqdns}"

  tags = {
    Name          = "${var.certificate_name}"
    ProductDomain = "${var.product_domain}"
    Environment   = "${var.environment}"
    Description   = "${var.description}"
    ManagedBy     = "terraform"
  }
}

resource "aws_route53_record" "this" {
  name    = "${aws_acm_certificate.this.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.this.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.zone.id}"
  records = ["${aws_acm_certificate.this.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

locals {
  san_fqdns = "${keys(var.san_map)}"
  verification_fqdn_list = [ "${aws_route53_record.this.fqdn}", "${local.san_fqdns}" ] 
}

resource "aws_route53_record" "this-san" {
  count = "${length(local.san_fqdns)  }"
  # count.index +1 because the first one is the primary fqdn/validation
  name    = "${lookup(aws_acm_certificate.this.domain_validation_options[ count.index + 1 ], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.this.domain_validation_options[ count.index + 1 ], "resource_record_type")}"
  zone_id = "${data.aws_route53_zone.san-zones.*.id[ count.index ]}"
  records    = ["${lookup(aws_acm_certificate.this.domain_validation_options[ count.index + 1 ], "resource_record_value")}" ]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "dns_validation" {
  certificate_arn         = "${aws_acm_certificate.this.arn}"
  validation_record_fqdns = [ "${aws_route53_record.this.fqdn}", "${aws_route53_record.this-san.*.fqdn}"]
}

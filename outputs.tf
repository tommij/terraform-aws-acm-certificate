output "acm_certificate_arn" {
  description = "arn of acm certificate"
  value       = "${aws_acm_certificate.this.arn}"
}

output "acm_certificate_dns_validation_record" {
  description = "record which is used to validate acm certificate"
  value       = "${aws_route53_record.this.name}"
}

output "acm_certificate_san_dns_validation_records" {
  description = "records which is used to validate san parts of the acm certificate"
  value       = "${aws_route53_record.this-san.*.name}"
}

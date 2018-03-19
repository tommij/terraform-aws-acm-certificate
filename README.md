# terraform-aws-acm-certificate #

Terraform module to create acm certificate

This module create interconnected resources:
* [AWS ACM Certificate](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html)
* [AWS ACM Certificate Validation](https://www.terraform.io/docs/providers/aws/r/acm_certificate_validation.html)

## Known Issues/Limitations##
AWS doesn't support dns validation for private hosted zone, you must use EMAIL validation instead.

## Usage ##

## Authors ##

Module managed by [BernardSiahaan](https://github.com/siahaanbernard/)


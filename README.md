# terraform-aws-acm-certificate #

This Terraform module creates TLS/SSL certificate in Amazon Certificate Manager (ACM), and validates it with DNS by creating required Route 53 validation record in the given Route 53 hosted zone.

This module creates the following resources:
* [aws_acm_certificate](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html)
* [aws_route53_record](https://www.terraform.io/docs/providers/aws/r/route53_record.html)
* [aws_acm_certificate_validation](https://www.terraform.io/docs/providers/aws/r/acm_certificate_validation.html)

## Usage ##

```hcl
module "wildcard_certificate" {
  source              = "https://github.com/traveloka/terraform-aws-acm-certificate?ref=vX.Y.Z"
  domain_name         = "*.pda.example.com"
  hosted_zone_name    = "pda.example.com"
  certificate_name    = "wildcard.pda.example.com"
  environment         = "production"
  description         = "Wildcard certificate for pda.example.com"
  product_domain      = "pda"
}
```

## Examples ##
Please see examples dir for examples on how to use this module:
* [Examples](https://github.com/traveloka/terraform-aws-acm-certificate/tree/master/examples)

## Authors ##
Module managed by [BernardSiahaan](https://github.com/siahaanbernard/)

variable "certificate_name" {
  description = "name of the ACM certificate"
}

variable "product_domain" {
  description = "abbreviation of the product domain this ACM certificate belongs to"
}

variable "environment" {
  description = "environment this ACM certificate belongs to"
}

variable "description" {
  description = "free form description of this ACM certificate"
}

variable "domain_name" {
  description = "domain name for certificate should be issued"
}

variable "validation_method" {
  description = "define acm certificate validation method using dns or or email"
}

variable "hosted_zone_name" {
  description = "domain name of hosted zone"
}

variable "hosted_zone_private" {
  description = "define whether a hoted zone is private or public, true for private. false for public"
}

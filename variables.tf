variable "domain_name" {
  description = "domain name for certificate should be issued"
}

variable "tags" {
  description = "tag for acm certificate"
  type        = "map"
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

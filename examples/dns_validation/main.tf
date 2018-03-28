module "acm" {
  source = "../../"

  domain_name         = "*.example.stg.tvlk.cloud"
  hosted_zone_name    = "stg.tvlk.cloud"
  hosted_zone_private = "false"
  validation_method   = "DNS"
  certificate_name    = "example.stg.tvlk.cloud"
  environment         = "staging"
  description         = "wildcard certificate for example.stg.tvlk.cloud"
  product_domain      = "exm"
}

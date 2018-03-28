module "acm" {
  source = "../../"

  domain_name         = "*.example.stg.tvlk.cloud"
  hosted_zone_name    = "stg.tvlk.cloud"
  hosted_zone_private = "true"
  validation_method   = "EMAIL"
  certificate_name    = "example.stg.tvlk.cloud"
  environment         = "staging"
  description         = "wildcard certificate for example.stg.tvlk.cloud"
  product_domain      = "exm"
}

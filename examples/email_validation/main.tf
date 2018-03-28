module "acm" {
  source              = "../"
  domain_name         = "test.stg.tvlk.cloud"
  hosted_zone_name    = "stg.tvlk.cloud"
  hosted_zone_private = "true"
  validation_method   = "EMAIL"

  tags = {
    Name = "wildcard certificate for stg.tvlk.cloud"
  }
}

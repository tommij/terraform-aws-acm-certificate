module "acm" {
  source              = "../"
  domain_name         = "test.stg.tvlk.cloud"
  hosted_zone_name    = "stg.tvlk.cloud"
  hosted_zone_private = "false"
  validation_method   = "DNS"

  tags = {
    Name = "wildcard certificate for stg.tvlk.cloud"
  }
}

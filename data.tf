data "aws_route53_zone" "zone" {
  name         = "${var.hosted_zone_name}"
  private_zone = "false"
}

data "aws_route53_zone" "san-zones" {
  count        = "${length(local.san_fqdns)}"
  name         = "${lookup(var.san_map, local.san_fqdns[count.index])}"
  private_zone = "false"
}

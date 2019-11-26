variable "endpoint" {
  type = string
  description = "DNS endpoint which serves traffic for rubyapi.org"
}

variable "domain" {
  type = string
  description = "domain name"
  default = "rubyapi.org"
}

provider "cloudflare" {
  version = "~> 2.0"
}

resource "cloudflare_zone" "rubyapi-org" {
  zone = "rubyapi.org"
}

resource "cloudflare_record" "default" {
  zone_id = cloudflare_zone.rubyapi-org.id
  name = var.domain
  type = "CNAME"
  value = var.endpoint
  proxied  = true
}
terraform {
  required_version = ">= 0.12"
}

provider "google" {
  region  = "us-east4"
  zone    = "us-east4-a"
  project = "cloudfico-dev"
  version = "2.20.0"
}

provider "google-beta" {
  region  = "us-east4"
  zone    = "us-east4-a"
  project = "cloudfico-dev"
  version = "2.20.0"
}
resource "null_resource" "check_name" {

}


data "google_dns_managed_zone" "env_dns_zone" {
  name = "steven-zone"
}

resource "google_dns_record_set" "dns" {
  name = "my-address.${data.google_dns_managed_zone.env_dns_zone.dns_name}"
  type = "TXT"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.env_dns_zone.name

  rrdatas = ["test"]
}

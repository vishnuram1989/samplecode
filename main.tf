terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.66.1"
    }
  }
}

provider "google" {
  region  = "us-east4"
  zone    = "us-east4-a"
  project = "cloudfico-dev"
}

provider "google-beta" {
  region  = "us-east4"
  zone    = "us-east4-a"
  project = "cloudfico-dev"
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

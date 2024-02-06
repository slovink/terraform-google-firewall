provider "google" {
  project = "local-concord-408802"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### vpc module call.
#####==============================================================================
module "vpc" {
  source                                    = "git::https://github.com/slovink/terraform-google-vpc.git?ref=v1.0.0"
  name                                      = "ops"
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
}

#####==============================================================================
##### Firewall module call.
#####==============================================================================
module "firewall" {
  source        = "../"
  name          = "ops"
  environment   = "test"
  network       = module.vpc.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  allow = [
    {
      protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}

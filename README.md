<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform Gcp Firewall
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create Firewall resource on Gcp.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


## Prerequisites

This module has a few dependencies:

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/slovink/terraform-gcp-firewall).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
  ```hcl
module "firewall" {
  source = "../"

  name                            = "test-firewall"
  module_enabled                  = true
  google_compute_firewall_enabled = true
  project_id                      = var.gcp_project_id
  network                         = module.vpc.vpc_id
  description                     = "Creates firewall rule targeting tagged instances."
  protocol                        = "TCP"
  ports                           = ["80", "4440", "443", "22"]
  source_ranges                   = ["0.0.0.0/0"]

}
  ```



## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/slovink/terraform-gcp-firewall), or feel free to drop us an email at [devops@slovink.com](devops@slovink.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/slovink/terraform-gcp-firewall)!

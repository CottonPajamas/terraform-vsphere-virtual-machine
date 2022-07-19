variable "datacenter" {
  default = ""
}

variable "resource_pool" {
  default = ""
}

variable "datastore" {
  default = ""
}

variable "network" {
  default = ""
}

variable "vm_name_prefix" {
  default = ""
}

variable "vm_count" {
  default = ""
}

variable "template_name" {
  default = ""
}

variable "linked_clone" {
  default = ""
}

variable "domain_name" {
  default = ""
}

variable "ipv4_network_address" {
  default = ""
}

variable "ipv4_address_start" {
  default = ""
}

variable "ipv4_gateway" {
  default = ""
}

variable "dns_servers" {
#  type = "list"
  default = ""
}

variable "template_os_family" {
  default = "linux"
}

module "virtual_machines" {
  source               = "../../"
  datacenter           = "${var.datacenter}"
  datastore            = "${var.datastore}"
  dns_servers          = ["${var.dns_servers}"]
  domain_name          = "${var.domain_name}"
  ipv4_address_start   = "${var.ipv4_address_start}"
  ipv4_gateway         = "${var.ipv4_gateway}"
  ipv4_network_address = "${var.ipv4_network_address}"
  linked_clone         = "${var.linked_clone}"
  network              = "${var.network}"
  resource_pool        = "${var.resource_pool}"
  template_name        = "${var.template_name}"
  template_os_family   = "${var.template_os_family}"
  vm_count             = "${var.vm_count}"
  vm_name_prefix       = "${var.vm_name_prefix}"
}

output "virtual_machine_names" {
  value = "${module.virtual_machines.virtual_machine_names}"
}

output "virtual_machine_ids" {
  value = "${module.virtual_machines.virtual_machine_ids}"
}

output "virtual_machine_default_ips" {
  value = "${module.virtual_machines.virtual_machine_default_ips}"
}

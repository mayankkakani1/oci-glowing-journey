terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
    }
  }
}

provider "oci"{
    region = var.region
}

resource "oci_core_vcn" "example_vcn" {
    compartment_id = var.compartment_id
    display_name = "example_vcn"
    cidr_blocks = ["172.16.0.0/20"]
}

resource "oci_core_subnet" "example_subnet1" {
    compartment_id = var.compartment_id
    display_name = "example_subnet1"
    vcn_id = oci_core_vcn.example_vcn.id
    cidr_block = "172.16.0.0/24"
}

resource "oci_core_subnet" "example_subnet2" {
    compartment_id = var.compartment_id
    display_name = "example_subnet2"
    vcn_id = oci_core_vcn.example_vcn.id
    cidr_block = "172.16.1.0/24"
}

resource "oci_core_subnet" "example_subnet3" {
    compartment_id = var.compartment_id
    display_name = "example_subnet3"
    vcn_id = oci_core_vcn.example_vcn.id
    cidr_block = "172.16.2.0/24"
}

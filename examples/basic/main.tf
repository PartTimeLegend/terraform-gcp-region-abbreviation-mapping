locals {
  gcp_region = "us-east4"
}

module "region_abbreviation" {
  source = "../../"
}

output "region_abbreviation" {
  value = module.region_abbreviation.gcp_region_abbr_map[local.gcp_region]
}

output "all_region_names" {
  value = module.region_abbreviation.region_names
}

output "all_abbreviations" {
  value = module.region_abbreviation.region_abbreviations
}

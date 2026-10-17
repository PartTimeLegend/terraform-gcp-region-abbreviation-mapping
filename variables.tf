variable "gcp_region_abbr_map" {
  type        = map(string)
  description = "Map of GCP region IDs to short abbreviations for naming resources"
  default = {
    "africa-south1"           = "afs1"
    "asia-east1"              = "ase1"
    "asia-east2"              = "ase2"
    "asia-northeast1"         = "asn1"
    "asia-northeast2"         = "asn2"
    "asia-northeast3"         = "asn3"
    "asia-south1"             = "ass1"
    "asia-south2"             = "ass2"
    "asia-southeast1"         = "asse1"
    "asia-southeast2"         = "asse2"
    "asia-southeast3"         = "asse3"
    "asia-southeast4"         = "asse4"
    "asia-southeast5"         = "asse5"
    "australia-southeast1"    = "ause1"
    "australia-southeast2"    = "ause2"
    "australia-southeast3"    = "ause3"
    "europe-central2"         = "euc2"
    "europe-north1"           = "eun1"
    "europe-north2"           = "eun2"
    "europe-north3"           = "eun3"
    "europe-southwest1"       = "eusw1"
    "europe-southwest2"       = "eusw2"
    "europe-west1"            = "euw1"
    "europe-west2"            = "euw2"
    "europe-west3"            = "euw3"
    "europe-west4"            = "euw4"
    "europe-west6"            = "euw6"
    "europe-west8"            = "euw8"
    "europe-west9"            = "euw9"
    "europe-west10"           = "euw10"
    "europe-west11"           = "euw11"
    "europe-west12"           = "euw12"
    "europe-west13"           = "euw13"
    "me-central1"             = "mec1"
    "me-central2"             = "mec2"
    "me-central3"             = "mec3"
    "me-west1"                = "mew1"
    "me-west2"                = "mew2"
    "northamerica-northeast1" = "nane1"
    "northamerica-northeast2" = "nane2"
    "northamerica-northeast3" = "nane3"
    "northamerica-south1"     = "nas1"
    "northamerica-south2"     = "nas2"
    "southamerica-east1"      = "sae1"
    "southamerica-east2"      = "sae2"
    "southamerica-west1"      = "saw1"
    "southamerica-west2"      = "saw2"
    "us-central1"             = "usc1"
    "us-east1"                = "use1"
    "us-east4"                = "use4"
    "us-east5"                = "use5"
    "us-east6"                = "use6"
    "us-south1"               = "uss1"
    "us-south2"               = "uss2"
    "us-west1"                = "usw1"
    "us-west2"                = "usw2"
    "us-west3"                = "usw3"
    "us-west4"                = "usw4"
    "us-west5"                = "usw5"
    "us-west6"                = "usw6"
  }
}

locals {
  gcp_region_abbr_map_normalized = {
    for region_name, abbreviation in var.gcp_region_abbr_map :
    lower(replace(region_name, "-", "")) => abbreviation
  }

  gcp_region_abbr_lookup_map = merge(
    var.gcp_region_abbr_map,
    local.gcp_region_abbr_map_normalized,
  )
}

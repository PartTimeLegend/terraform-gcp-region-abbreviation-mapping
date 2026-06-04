output "gcp_region_abbr_map" {
  value       = var.gcp_region_abbr_map
  description = "The canonical map of GCP region IDs to abbreviations."
}

output "lookup_region_abbreviation" {
  value       = local.gcp_region_abbr_lookup_map
  description = "Map for looking up a region abbreviation from either the canonical region ID or a normalized lowercase name without hyphens."
}

output "region_names" {
  value       = keys(var.gcp_region_abbr_map)
  description = "List of canonical GCP region IDs."
}

output "region_abbreviations" {
  value       = values(var.gcp_region_abbr_map)
  description = "List of all region abbreviations."
}

# Terraform GCP Region Abbreviation Mapping

[![Tag](https://github.com/PartTimeLegend/terraform-gcp-region-abbreviation-mapping/actions/workflows/tag.yml/badge.svg)](https://github.com/PartTimeLegend/terraform-gcp-region-abbreviation-mapping/actions/workflows/tag.yml)

A simple module that provides mappings between Google Cloud region IDs and standardized abbreviations for consistent resource naming.

## Features

- Mapping of common GCP region IDs to short abbreviations
- Supports both canonical region IDs and normalized lowercase names without hyphens
- Helper output map to simplify regional naming across GCP resources
- Zero external dependencies

## Usage

### Basic Usage

```terraform
locals {
  gcp_region = "us-central1"
}

module "region_abbreviation_mapping" {
  source  = "PartTimeLegend/region-abbreviation-mapping/gcp"
  version = "~> 1.0" # Replace with the latest version
}

output "region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.gcp_region]
}
```

### Using Normalized Region IDs

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/gcp"
}

locals {
  canonical_region  = "europe-west4"
  normalized_region = "europewest4"
}

output "canonical_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.canonical_region]
}

output "normalized_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.normalized_region]
}
```

### Using the Region Lookup Map

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/gcp"
}

locals {
  resource_name = "${module.region_abbreviation_mapping.lookup_region_abbreviation["us-east4"]}-app"
}
```

## Available Outputs

| Name | Description |
|------|-------------|
| `gcp_region_abbr_map` | Canonical map of GCP region IDs to their abbreviations |
| `lookup_region_abbreviation` | Lookup map supporting canonical region IDs and normalized lowercase names without hyphens |
| `region_names` | List of canonical GCP region IDs |
| `region_abbreviations` | List of all region abbreviations |

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

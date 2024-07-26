terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.40.1"
    }
  }
}

provider "newrelic" {
  account_id = "4438261"
  api_key    = var.apikey
  region     = "US" # Optional, can be one of "US", "EU", "APAC"
}

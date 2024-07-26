resource "newrelic_alert_policy" "APM" {
  for_each = var.alertpolicy
  name = each.value.name
  incident_preference = each.value.incident_preference # PER_POLICY is default
}

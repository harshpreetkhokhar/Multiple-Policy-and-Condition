
output "policy-id" {
  value = {for x,y in newrelic_alert_policy.APM:x=>y.id}
}
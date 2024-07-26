
locals {
  conditions_list = [
    for policy, conditions in var.alert-condition-1 : [
      for condition_key, condition in conditions : {
        policy_key = policy
        condition_key = condition_key
        condition = condition
      }
    ]
  ]
}

resource "newrelic_nrql_alert_condition" "APM-Condition" {
   for_each = {
    for cond in flatten(local.conditions_list) : "${cond.policy_key}_${cond.condition_key}" => cond
  }

  account_id = each.value.condition.account_id
  policy_id                      = var.policy-id[each.value.condition_key]
  type                           = each.value.condition.type
  name                           = each.value.condition.name
  description                    = each.value.condition.description
  runbook_url                    = each.value.condition.runbook_url
  enabled                        = each.value.condition.enabled
  violation_time_limit_seconds   = each.value.condition.violation_time_limit_seconds
  fill_option                    = each.value.condition.fill_option
  fill_value                     = each.value.condition.fill_value
  aggregation_window             = each.value.condition.aggregation_window
  aggregation_method             = each.value.condition.aggregation_method
  aggregation_delay              = each.value.condition.aggregation_delay
  expiration_duration            = each.value.condition.expiration_duration
  open_violation_on_expiration   = each.value.condition.open_violation_on_expiration
  close_violations_on_expiration = each.value.condition.close_violations_on_expiration
  slide_by                       = each.value.condition.slide_by

  nrql {
    query = each.value.condition.query
  }

  dynamic "critical" {
    for_each = each.value.condition.critical ? [each.value.condition]:[]
    content {
        operator              = each.value.condition.c_operator
    threshold             = each.value.condition.c_threshold
    threshold_duration    = each.value.condition.c_threshold_duration
    threshold_occurrences = each.value.condition.c_threshold_occurence
    }
  
  }
  dynamic "warning" {
    for_each = each.value.condition.warning ? [each.value.condition]:[]
    content{
      operator              = each.value.condition.w_operator
    threshold             = each.value.condition.w_threshold
    threshold_duration    = each.value.condition.w_threshold_duration

    threshold_occurrences = each.value.condition.w_threshold_occurence  
    }
    
  }
}
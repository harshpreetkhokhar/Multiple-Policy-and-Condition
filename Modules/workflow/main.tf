resource "newrelic_workflow" "foo" {
  for_each = var.workflow-1
  name = each.value.name
  muting_rules_handling = each.value.muting_rules_handling

  issues_filter {
    name = each.value.issue_name
    type = each.value.type

    predicate {
      attribute = each.value.predicate-1.attribute
      operator = each.value.predicate-1.operator
      values = [var.policy-id[each.key]]
    }
    predicate {
      attribute = each.value.predicate-2.attribute
      operator = each.value.predicate-2.operator
      values = ["HIGH"]
    }
    
  }

  destination {
    channel_id = var.channel_id[each.key]
  }
}
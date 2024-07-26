resource "newrelic_notification_destination" "destination-1" {
 for_each = var.destination
  account_id = each.value.account_id
  name = each.value.name
  type = each.value.type

  property {
    key = each.value.key
    value = each.value.value
  }
}
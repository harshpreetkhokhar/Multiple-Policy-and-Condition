resource "newrelic_notification_channel" "channel-1" {
for_each = var.channel-1
  destination_id = var.destination_id[each.key]
  account_id = each.value.account_id
  name = each.value.name
  type = each.value.type
  product = each.value.product

  
  property {
    key = each.value.key
    value = each.value.value
  }
  # property {
  #   key = "customDetailsEmail"
  #   value = "Alerting"
  # }
}
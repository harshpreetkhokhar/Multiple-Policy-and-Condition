output "channel--id" {
  value = {for x,y in newrelic_notification_channel.channel-1:x=>y.id}
}
output "destination--id" {
  value = {for x,y in newrelic_notification_destination.destination-1:x=>y.id}
  }



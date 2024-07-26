module "policy-bnyegi" {
  source = "./Modules/policy"
  alertpolicy = var.alertpolicy

}

module "policy-1" {
  source = "./Modules/alert"
  alert-condition-1 = var.alert-condition-1
  policy-id = module.policy-bnyegi.policy-id
}

# module "dashboard-1" {
#   source = "./Modules/dashboard"
#   dashboard-1 = var.dashboard-1
# }

module "workflow" {
  source = "./Modules/workflow"
  workflow-1 = var.workflow-1
  channel_id = module.channel.channel--id
   policy-id = module.policy-bnyegi.policy-id
}
module "channel" {
  source = "./Modules/channel"
  channel-1 = var.channel-1
  destination_id = module.destination.destination--id
}
module "destination" {
  source = "./Modules/destination"
  destination = var.destination
  recipient-email = var.recipient-email
}
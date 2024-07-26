variable "alert-condition-1" {
type= any
}

variable "alertpolicy" {
  type = any
}
# variable "c-1" {
#   type = any
# }
# variable "dashboard-1" {
#     type= map(map(any))
# }

variable "workflow-1" {
  type= any
}

variable "recipient-email" {
  description = "email of the recipient of alert"
}

variable "destination" {
    type = any
}

variable "channel-1" {
    type = any
}


# variable "destination_id" {
#   type = string
# }

# variable "channel_id" {
#   type = string
# }
variable "apikey" {
  type=any
}
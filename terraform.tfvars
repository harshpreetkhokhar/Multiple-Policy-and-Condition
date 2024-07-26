recipient-email = "gauravv.bhainsora1@gmail.com"
alertpolicy = {
  "0"={
    name :"Alert Policy 1"
    incident_preference: "PER_POLICY"
}
  "1"={
    name :"Alert Policy 2"
    incident_preference: "PER_POLICY"
}
}

#CONDITIONS
alert-condition-1 = {
  "A" = {
      "0"={
    account_id = "4438261"
    type = "static"
    name = "CONDITION-1"
    description = "Alert when transaction are taking too long"
    runbook_url = "hhttps://www.example.com"
    enabled = true
    violation_time_limit_seconds = 3600
    fill_option = "static"
    fill_value = 1.0
    aggregation_window = 60
    aggregation_method = "event_flow"
    aggregation_delay = 120
    expiration_duration = 120
    open_violation_on_expiration = true
    close_violations_on_expiration = true
    slide_by = 30
    query = "SELECT average(duration) FROM Transaction "
    critical = true
    c_operator ="above"
    c_threshold ="5.5"
    c_threshold_duration = 300
    c_threshold_occurence = "ALL"
     
    warning = true
    w_operator ="above"
    w_threshold ="3.5"
    w_threshold_duration = 300
    w_threshold_occurence = "ALL"
    },
  "1"={
    account_id = "4438261"
    type = "static"
    name = "CONDITION-2"
    description = "Alert when transaction are taking too long"
    runbook_url = "hhttps://www.example.com"
    enabled = true
    violation_time_limit_seconds = 3600
    fill_option = "static"
    fill_value = 1.0
    aggregation_window = 60
    aggregation_method = "event_flow"
    aggregation_delay = 120
    expiration_duration = 120
    open_violation_on_expiration = true
    close_violations_on_expiration = true
    slide_by = 30
    query = "SELECT average(duration) FROM Transaction "
    critical = true
    c_operator ="above"
    c_threshold ="5.5"
    c_threshold_duration = 300
    c_threshold_occurence = "ALL"
    
    warning = false
  }
},
"B"= {
   "0"={
    account_id = "4438261"
    type = "static"
    name = "CONDITION-1"
    description = "Alert when transaction are taking too long"
    runbook_url = "hhttps://www.example.com"
    enabled = true
    violation_time_limit_seconds = 3600
    fill_option = "static"
    fill_value = 1.0
    aggregation_window = 60
    aggregation_method = "event_flow"
    aggregation_delay = 120
    expiration_duration = 120
    open_violation_on_expiration = true
    close_violations_on_expiration = true
    slide_by = 30
    query = "SELECT average(duration) FROM Transaction "
    critical = true
    c_operator ="above"
    c_threshold ="5.5"
    c_threshold_duration = 300
    c_threshold_occurence = "ALL"
     
    warning = true
    w_operator ="above"
    w_threshold ="3.5"
    w_threshold_duration = 300
    w_threshold_occurence = "ALL"
  },
  "1"={
    account_id = "4438261"
    type = "static"
    name = "CONDITION-2"
    description = "Alert when transaction are taking too long"
    runbook_url = "hhttps://www.example.com"
    enabled = true
    violation_time_limit_seconds = 3600
    fill_option = "static"
    fill_value = 1.0
    aggregation_window = 60
    aggregation_method = "event_flow"
    aggregation_delay = 120
    expiration_duration = 120
    open_violation_on_expiration = true
    close_violations_on_expiration = true
    slide_by = 30
    query = "SELECT average(duration) FROM Transaction "
    critical = true
    c_operator ="above"
    c_threshold ="5.5"
    c_threshold_duration = 300
    c_threshold_occurence = "ALL"
    
    warning = false
  }
}
}
# #DASHBAORD
# dashboard-1 = {
#   "dash-0" = {
#     name = "Terraform Dashboard Task"
#   page = true
#     page_name = "New Relic Terraform "

#     widget_billboard = true
#       bill_title  = "Requests per minute"
#       bill_row    = 1
#       bill_column = 1
#       bill_width  = 6
#       bill_height = 3
#       bill_query = "FROM Transaction SELECT rate(count(*), 1 minute) WHERE appName='FoodMe-test'"
#     widget_bar = true
#       bar_title  = "Response time"
#       bar_row = 1
#       bar_column = 7
#       bar_width = 6
#       bar_height = 3
#       bar_query = "FROM Transaction SELECT average(duration) WHERE appName='FoodMe-test'"
#       account_id = "4438261"
#   }
# }
#WORKFLOW
workflow-1 = {
  "0" = {
    name = "Terraform Workflow Task"
     muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter = true
    issue_name = "filter"
    type = "FILTER"

    predicate-1={
      attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"
    }
       predicate-2={
      attribute = "priority"
      operator = "EXACTLY_MATCHES"
    }
    }
      "1" = {
    name = "Terraform Workflow Task-2"
     muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter = true
    issue_name = "filter"
    type = "FILTER"

    predicate-1={
      attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"
      
    }
     predicate-2={
      attribute = "priority"
      operator = "EXACTLY_MATCHES"
    }
    destination = true
    # channel_id = var.channel_id
  }
}

#DESTINATION
destination= {
  "0"={
  account_id = "4438261"
  name = "destination-1"
  type = "EMAIL"

    key = "email"
    value = "gauravv.bhainsora1@gmail.com"
  }
  "1"={
  account_id = "4438261"
  name = "destination-1"
  type = "EMAIL"

    key = "email"
    value = "gauravv.bhainsora1@gmail.com"
  }
  }


#CHANNEL
channel-1 = {
 "0"={
    account_id = "4438261"
    name = "channel-1"
    type = "EMAIL"
    product = "IINT"
    property = true
    key = "email"
    value = "gauravv.bhainsora1@gmail.com"
 }
  "1"={
    account_id = "4438261"
    name = "channel-1"
    type = "EMAIL"
    product = "IINT"
    property = true
    key = "email"
    value = "gauravv.bhainsora1@gmail.com"
 }
}
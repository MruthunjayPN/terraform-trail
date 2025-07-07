[application]
name = ${project_name}
environment = ${environment}
port = ${port}
debug = ${debug_mode}
max_users = ${max_users}

[system]
created_by = terraform
timestamp = ${timestamp()}

[features]
backup_enabled = true
monitoring_enabled = true
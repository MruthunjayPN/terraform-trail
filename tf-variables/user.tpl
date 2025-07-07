[user]
username = ${username}
project = ${project}
environment = ${environment}
access_level = ${access_level}
created_at = ${timestamp()}

[permissions]
read = true
write = ${access_level == "admin" ? "true" : "false"}
admin = ${access_level == "admin" ? "true" : "false"}
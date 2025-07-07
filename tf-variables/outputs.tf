# Output the project information
output "project_info" {
  description = "Basic project information"
  value = {
    name        = var.project_name
    environment = var.environment
    team_size   = length(var.team_members)
  }
}

# Output all created files
output "created_files" {
  description = "List of all created files"
  value = {
    structure_files = [for k, v in local_file.project_structure : v.filename]
    config_file     = local_file.app_config.filename
    team_files      = [for f in local_file.team_access : f.filename]
    backup_script   = var.create_backup ? local_file.backup_script[0].filename : "Not created"
  }
}

# Output configuration details
output "app_config" {
  description = "Application configuration"
  value = {
    port       = var.config_settings.port
    debug_mode = var.config_settings.debug_mode
    max_users  = var.config_settings.max_users
  }
}

# Output team members with their access levels
output "team_access" {
  description = "Team member access information"
  value = {
    for i, member in var.team_members : member => {
      access_level = i == 0 ? "admin" : "developer"
      config_file  = "${var.project_name}-${var.environment}/config/users/${member}.conf"
    }
  }
}
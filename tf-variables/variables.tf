# Project configuration variables
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "my-app"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "team_members" {
  description = "List of team members"
  type        = list(string)
  default     = ["alice", "bob", "charlie"]
}

variable "create_backup" {
  description = "Whether to create backup files"
  type        = bool
  default     = true
}

variable "config_settings" {
  description = "Application configuration"
  type = object({
    port        = number
    debug_mode  = bool
    max_users   = number
  })
  default = {
    port        = 8080
    debug_mode  = true
    max_users   = 100
  }
}

variable "file_permissions" {
  description = "File permissions for created files"
  type        = string
  default     = "0644"
}
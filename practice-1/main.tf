terraform {
  required_providers {
    local =  {
        source = "hashicorp/local"
        version = "~>2.0"
    }
  }
}

resource "local_file" "hello_world" {
  content = "Hello, Terraform World!\nThis is my UPDATED infrastructure file.\nI'm learning Terraform!"
  filename = "${path.module}/hello.txt"
}

resource "local_file" "timestamp" {
  content = "this file has been created at ${timestamp()}"
  filename = "${path.module}/created_at.txt"
}

output "hello_file_path" {
  value = local_file.hello_world.filename
}

output "timestamp_file_path" {
  value = local_file.timestamp.filename
}

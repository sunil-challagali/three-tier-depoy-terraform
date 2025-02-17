# variables.tf

variable "web_ami_id" {
  description = "AMI ID for the web server"
}

variable "app_ami_id" {
  description = "AMI ID for the app server"
}

variable "db_ami_id" {
  description = "AMI ID for the DB server"
}

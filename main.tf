# main.tf

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
}

module "ec2_instances" {
  source = "./modules/ec2_instances"
  web_ami_id = "ami-xxxxxx"  # Replace with your actual AMI ID for Web tier
  app_ami_id = "ami-xxxxxx"  # Replace with your actual AMI ID for App tier
}

module "rds" {
  source = "./modules/rds"
}

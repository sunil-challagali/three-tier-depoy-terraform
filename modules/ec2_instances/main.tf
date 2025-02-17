# modules/ec2_instances/main.tf

resource "aws_instance" "web_server" {
  ami           = var.web_ami_id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.web_subnet_id
  security_groups = [module.security_groups.web_sg.id]
  tags = {
    Name = "web_server"
  }
}

resource "aws_instance" "app_server" {
  ami           = var.app_ami_id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.app_subnet_id
  security_groups = [module.security_groups.app_sg.id]
  tags = {
    Name = "app_server"
  }
}

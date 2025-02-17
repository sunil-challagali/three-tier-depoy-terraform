# modules/rds/main.tf

resource "aws_db_instance" "oracle_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "oracle-se2"  # Use Oracle Standard Edition 2
  engine_version       = "19.0.0.0.ru-2020-04.rur-2020-04.r1"
  instance_class       = "db.t3.micro"
  name                 = "myoracledb"
  username             = "admin"
  password             = "your_password"
  db_subnet_group_name = module.vpc.db_subnet_group_name
  vpc_security_group_ids = [module.security_groups.db_sg.id]

  multi_az             = false  # Change to true for multi-AZ deployment
  publicly_accessible  = false  # Make sure this is false for security reasons
  final_snapshot_identifier = "myoracledb-final-snapshot"
  
  tags = {
    Name = "oracle_db_instance"
  }

  backup_retention_period = 7  # Retain backups for 7 days
}

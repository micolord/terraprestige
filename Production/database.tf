resource "aws_db_subnet_group" "db-sub" {
  name       = "${var.env_name}-${var.project}-subnet-group"
  subnet_ids = [aws_subnet.private_subnet7.id, aws_subnet.private_subnet8.id]

  tags = {
    Name     = "${var.env_name}-${var.project}-subnet-group"
  }
}

resource "aws_db_parameter_group" "masterparametergroup" {
  name   = "${var.env_name}-${var.project}-parameter-group"
  family = "mariadb10.6"

}

resource "aws_db_option_group" "masteroptiongroup" {
  name                     = "${var.env_name}-${var.project}-option-group"
  option_group_description = "Terraform Option Group"
  engine_name              = "mariadb"
  major_engine_version     = "10.6"

}

resource "random_password" "master"{
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "masterpassword" {
  name = "${var.env_name}-${var.project}-master-db-password"
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id = aws_secretsmanager_secret.masterpassword.id
  secret_string = random_password.master.result
}

resource "aws_db_instance" "master" {
  allocated_storage           = 200
  max_allocated_storage       = 500
  auto_minor_version_upgrade  = false                         
  backup_retention_period     = 7
  backup_window               = "17:00-19:00"
  db_subnet_group_name        = aws_db_subnet_group.db-sub.name
  parameter_group_name        = aws_db_parameter_group.masterparametergroup.name
  option_group_name           = aws_db_option_group.masteroptiongroup.name
  engine                      = "mariadb"
  engine_version              = 10.6
  identifier                  = "${var.env_name}-${var.project}-master-db"
  instance_class              = "db.m6g.large"
  #kms_key_id                  = aws/rds
  multi_az                    = true 
  password                    = random_password.master.result
  username                    = "mbdbadmin"
  storage_encrypted           = true

  timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }
}
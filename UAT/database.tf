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
  #snapshot_identifier         = var.master_source_snap
  performance_insights_enabled = true
  deletion_protection         = false
  allocated_storage           = 200
  max_allocated_storage       = 500
  auto_minor_version_upgrade  = false                         
  backup_retention_period     = 7
  backup_window               = "17:00-19:00"
  db_subnet_group_name        = aws_db_subnet_group.db-sub.name
  parameter_group_name        = aws_db_parameter_group.masterparametergroup.name
  option_group_name           = aws_db_option_group.masteroptiongroup.name
  engine                      = "mariadb"
  engine_version              = "10.6.10"
  identifier                  = "${var.env_name}-${var.project}-master-db"
  instance_class              = var.master_instance_class
  multi_az                    = true 
  password                    = random_password.master.result
  username                    = "metabetsadmin"
  storage_encrypted           = true
  port                        = "1561"
  vpc_security_group_ids      = [aws_security_group.sg7.id]
  final_snapshot_identifier   = "${var.env_name}-${var.project}-master-db-final-snapshot"
  skip_final_snapshot         = false
  apply_immediately           = true

  lifecycle {
    ignore_changes = [
      snapshot_identifier,
    ]
  }

  timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }
}

/*
resource "aws_db_instance" "replica" {
  replicate_source_db         = aws_db_instance.master.identifier
  auto_minor_version_upgrade  = false
  backup_retention_period     = 7
  identifier                  = "${var.env_name}-${var.project}-replica-db"
  instance_class              = var.replica_instance_class
  multi_az                    = false
  storage_encrypted           = true
  vpc_security_group_ids      = [aws_security_group.sg7.id]
  skip_final_snapshot         = true
  max_allocated_storage       = 500
  apply_immediately           = true

  timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }
}
*/

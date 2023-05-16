region  = "ap-southeast-1"
project = "metabets"
env_name = "prod"

// network details
vpc_cidr = "100.0.0.0/16"
public_subnet_cidr_1 = "100.0.0.0/24"
public_subnet_cidr_2 = "100.0.1.0/24"
private_subnet_cidr_1 = "100.0.2.0/24"
private_subnet_cidr_2 = "100.0.3.0/24"
private_subnet_cidr_3 = "100.0.4.0/24"
private_subnet_cidr_4 = "100.0.5.0/24"
private_subnet_cidr_5 = "100.0.6.0/24"
private_subnet_cidr_6 = "100.0.7.0/24"
private_subnet_cidr_7 = "100.0.8.0/24"
private_subnet_cidr_8 = "100.0.9.0/24"
availability_zone_1 = "ap-southeast-1a"
availability_zone_2 = "ap-southeast-1b"

//// ec2 instance details
// GameLobby
gl_fe_ami_id = "ami-0721577fdb2dd8dd8"
gl_fe_instance_type = "c5.4xlarge"
gl_be_ami_id = "ami-06a3a573262f2fa9e"
gl_be_instance_type = "c5.4xlarge"

// Back Office
bo_fe_ami_id = "ami-0e4e3a6b9f0c183c8"
bo_fe_instance_type = "c5.4xlarge"
bo_be_ami_id = "ami-0fbcd433c55d0ff62"
bo_be_instance_type = "c5.4xlarge"

// db instance details
master_source_snap = "arn:aws:rds:ap-southeast-1:824910182745:snapshot:adhoc-backup-metabets-db-uat-2023-05-15"
master_instance_class = "db.r6g.4xlarge"
replica_instance_class = "db.r6g.4xlarge"
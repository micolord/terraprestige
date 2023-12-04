// project details
region  = "ap-southeast-1"
project = "prestige"
env_name = "uat"

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
domain_name = "prestigeplay-uat.vip"
cert_arn = "arn:aws:acm:ap-southeast-1:955537627376:certificate/e34f7dc9-6250-4199-9899-e92cb9c7aaf2"

//// ec2 instance details
// GameLobby
gl_fe_ami_id = "ami-03caf91bb3d81b843"
gl_fe_instance_type = "c5.xlarge"
gl_be_ami_id =  "ami-03caf91bb3d81b843"
gl_be_instance_type = "c5.xlarge"

// Back Office
bo_fe_ami_id = "ami-03caf91bb3d81b843"
bo_fe_instance_type = "c5.xlarge"
bo_be_ami_id = "ami-03caf91bb3d81b843"
bo_be_instance_type = "c5.xlarge"

// Job processor
jp_instance_type = "c5.xlarge"
jp_ami_id = "ami-03caf91bb3d81b843"

// db instance details
//master_source_snap = "arn:aws:rds:ap-southeast-1:824910182745:snapshot:adhoc-backup-metabets-db-uat-2023-05-15"
master_instance_class = "db.r6g.xlarge"
//replica_instance_class = "db.r6g.xlarge"

// Static
static_domain = "static.metabets.vip"
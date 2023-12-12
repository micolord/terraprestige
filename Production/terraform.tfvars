// project details
region  = "ap-southeast-1"
project = "prestige"
env_name = "prod"

// network details
vpc_cidr = "100.0.20.0/16"
public_subnet_cidr_1 = "100.0.20.0/24"
public_subnet_cidr_2 = "100.0.21.0/24"
private_subnet_cidr_1 = "100.0.22.0/24"
private_subnet_cidr_2 = "100.0.23.0/24"
private_subnet_cidr_3 = "100.0.24.0/24"
private_subnet_cidr_4 = "100.0.25.0/24"
private_subnet_cidr_5 = "100.0.26.0/24"
private_subnet_cidr_6 = "100.0.27.0/24"
private_subnet_cidr_7 = "100.0.28.0/24"
private_subnet_cidr_8 = "100.0.29.0/24"
availability_zone_1 = "ap-southeast-1a"
availability_zone_2 = "ap-southeast-1b"
domain_name = "prestigeplay.net"
cert_arn = "arn:aws:acm:ap-southeast-1:955537627376:certificate/563adde1-40d6-46df-869f-dc2499079939"

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
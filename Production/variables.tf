variable "region" {
    description = "AWS deployment region"
}

variable "project" {
    description = "Project name"
}

variable "env_name" {
    description = "Environment Name"
}

variable "vpc_cidr" {
    description = "VPC CIDR block"
}

variable "public_subnet_cidr_1" {
    description = "Public subnet CIDR block"
}

variable "public_subnet_cidr_2" {
    description = "Public subnet CIDR block"
}

variable "private_subnet_cidr_1" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_2" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_3" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_4" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_5" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_6" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_7" {
    description = "Private subnet CIDR block"
}

variable "private_subnet_cidr_8" {
    description = "Private subnet CIDR block"
}

variable "availability_zone_1" {
    description = "Availability Zone A"
}

variable "availability_zone_2" {
    description = "Availability Zone B"
}

variable "gl_fe_ami_id" {
    description = "Instance AMI"
}

variable "gl_be_ami_id" {
    description = "Instance AMI"
}

variable "bo_fe_ami_id" {
    description = "Instance AMI"
}

variable "bo_be_ami_id" {
    description = "Instance AMI"
}

variable "gl_fe_instance_type" {
    description = "Instance type"
}

variable "gl_be_instance_type" {
    description = "Instance type"
}

variable "bo_fe_instance_type" {
    description = "Instance type"
}

variable "bo_be_instance_type" {
    description = "Instance type"
}

variable "replica_instance_class" {
    description = "Instance type"
}

variable "master_source_snap" {
    description = "Source snapshot ID"
}

variable "master_instance_class" {
    description = "Instance type"
}
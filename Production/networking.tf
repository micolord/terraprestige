resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "${var.env_name}-${var.project}-vpc"
    }
}

resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.env_name}-${var.project}-ig"
    }
}

resource "aws_subnet" "public_subnet1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.public_subnet_cidr_1
    availability_zone       =  var.availability_zone_1
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.env_name}-${var.project}-public-1"
    }
}
resource "aws_subnet" "public_subnet2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.public_subnet_cidr_2
    availability_zone       =  var.availability_zone_2
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.env_name}-${var.project}-public-2"
    }

}

resource "aws_route_table" "public"{
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.env_name}-${var.project}-public-rt"
    }
}

resource "aws_route" "public_internet_gateway" {
    route_table_id          = aws_route_table.public.id
    destination_cidr_block  =  "0.0.0.0/0"
    gateway_id              = aws_internet_gateway.ig.id
}

resource "aws_route_table_association" "public_1" {
    subnet_id       =  aws_subnet.public_subnet1.id 
    route_table_id  = aws_route_table.public.id

}

resource "aws_route_table_association" "public_2" {
    subnet_id       =  aws_subnet.public_subnet2.id 
    route_table_id  = aws_route_table.public.id

}
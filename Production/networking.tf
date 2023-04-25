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

resource "aws_subnet" "private_subnet1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_subnet_cidr_1
    availability_zone       =  var.availability_zone_1
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.env_name}-${var.project}-private-1"
    }

}

#resource "aws_subnet" "private_subnet2" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_2
#    availability_zone       =  var.availability_zone_2
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-2"
#    }

#}

#resource "aws_subnet" "private_subnet3" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_3
#    availability_zone       =  var.availability_zone_1
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-3"
#    }

#}

#resource "aws_subnet" "private_subnet4" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_4
#    availability_zone       =  var.availability_zone_2
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-4"
#    }

#}

#resource "aws_subnet" "private_subnet5" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_5
#    availability_zone       =  var.availability_zone_1
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-5"
#    }

#}

#resource "aws_subnet" "private_subnet6" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_6
#    availability_zone       =  var.availability_zone_2
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-6"
#    }

#}

#resource "aws_subnet" "private_subnet7" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_7
#    availability_zone       =  var.availability_zone_1
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-4"
#    }

#}

#resource "aws_subnet" "private_subnet8" {
#    vpc_id                  = aws_vpc.vpc.id
#    cidr_block              = var.private_subnet_cidr_8
#    availability_zone       =  var.availability_zone_2
#    map_public_ip_on_launch = false
#    tags = {
#        Name = "${var.env_name}-${var.project}-private-8"
#    }

#}

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

resource "aws_eip" "nat_eip_1" { 
  vpc      = true
}

resource "aws_eip" "nat_eip_2" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat_eip_1.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "${var.env_name}-${var.project}-nat-gw-1"
  }
  depends_on = [aws_internet_gateway.ig]
}

resource "aws_nat_gateway" "nat_gw_2" {
  allocation_id = aws_eip.nat_eip_2.id
  subnet_id     = aws_subnet.public_subnet2.id

  tags = {
    Name = "${var.env_name}-${var.project}-nat-gw-2"
  }
  depends_on = [aws_internet_gateway.ig]
}
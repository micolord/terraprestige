resource "aws_security_group" "sg1" {
    name = "${var.env_name}-${var.project}-GameLobby-LB-SG"
    description = "Allow inbound traffic via https"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        description     = "access to the EC2"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg2" {
    name = "${var.env_name}-${var.project}-BackOffice-LB-SG"
    description = "Allow inbound traffic via https"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        description     = "access to the EC2"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg3" {
    name = "${var.env_name}-${var.project}-GameLobbyFE-Compute-SG"
    description = "Allow inbound traffic from LB"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from LB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg1.id
    }

    egress {
        description     = "access to the world via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        description     = "access to the database"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg4" {
    name = "${var.env_name}-${var.project}-GameLobbyBE-Compute-SG"
    description = "Allow inbound traffic from LB"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from LB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg1.id
    }

    egress {
        description     = "access to the world via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        description     = "access to the database"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg5" {
    name = "${var.env_name}-${var.project}-BackOfficeFE-Compute-SG"
    description = "Allow inbound traffic from LB"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from LB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg2.id
    }

    egress {
        description     = "access to the world via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        description     = "access to the database"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg6" {
    name = "${var.env_name}-${var.project}-BackOfficeFE-Compute-SG"
    description = "Allow inbound traffic from LB"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from LB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg2.id
    }

    egress {
        description     = "access to the world via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        description     = "access to the database"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg7" {
    name = "${var.env_name}-${var.project}-DB-SG"
    description = "Allow inbound traffic from Compute"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "DB Access from Compute"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg3.id
    }

    ingress {
        description     = "DB Access from Compute"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg4.id
    }

    ingress {
        description     = "DB Access from Compute"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg5.id
    }

    ingress {
        description     = "DB Access from Compute"
        from_port       = 1561
        to_port         = 1561
        protocol        = "tcp"
        source_security_group_id = aws_security_group.sg6.id
    }

}
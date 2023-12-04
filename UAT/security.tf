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

    ingress {
        description     = "web access via http for forced redirection"
        from_port       = 80
        to_port         = 80
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

    ingress {
        description     = "web access via http for forced redirection"
        from_port       = 80
        to_port         = 80
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
        cidr_blocks     = ["${var.vpc_cidr}"]
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
        cidr_blocks     = ["${var.vpc_cidr}"]
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

    egress {
        description     = "access to the ses"
        from_port       = 587
        to_port         = 587
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
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
        cidr_blocks     = ["${var.vpc_cidr}"]
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
    name = "${var.env_name}-${var.project}-BackOfficeBE-Compute-SG"
    description = "Allow inbound traffic from LB"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from LB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
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

    egress {
        description     = "access to the ses"
        from_port       = 587
        to_port         = 587
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
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
        cidr_blocks     = ["${var.vpc_cidr}"]
    }

}

resource "aws_security_group" "sg8" {
    name = "${var.env_name}-${var.project}-JP-Compute-SG"
    description = "Allow outbound traffic"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from LB"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["${var.vpc_cidr}"]
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

    egress {
        description     = "access to the ses"
        from_port       = 587
        to_port         = 587
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

}

resource "aws_security_group" "sg9" {
    name = "${var.env_name}-${var.project}-JobProc-LB-SG"
    description = "Allow inbound traffic via https"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access via https"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        description     = "web access via http for forced redirection"
        from_port       = 80
        to_port         = 80
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
// GAME LOBBY LB
resource "aws_lb" "alb1" {
  name = "${var.env_name}-${var.project}-GameLobby-LB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg1.id]
  subnets            = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  enable_deletion_protection = false

  tags = {
    Name = "${var.env_name}-${var.project}-GameLobby-LB"
  }
}

// GAME LOBBY FE TG
resource "aws_lb_target_group" "alb1-tg" {
  name       = "${var.env_name}-${var.project}-GL-FE-TG"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-302"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

// GAME LOBBY BE TG
resource "aws_lb_target_group" "alb1-tg2" {
  name       = "${var.env_name}-${var.project}-GL-BE-TG"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-302"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

// GAME LOBBY 443 LISTENER
resource "aws_lb_listener" "alb1-listener" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:824910182745:certificate/3ba2ecd7-4085-4070-8ad0-e6884aea4c9b"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg.arn
  }
}

// GAME LOBBY LISTENER RULE for FE
resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = aws_lb_listener.alb1-listener.arn
  priority     = 1

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg.arn
  }

  condition {
    host_header {
      values = ["metabets.vip"]
    }
  }
}

// GAME LOBBY LISTENER RULE FOR BE
resource "aws_lb_listener_rule" "host_based_routing2" {
  listener_arn = aws_lb_listener.alb1-listener.arn
  priority     = 2

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg2.arn
  }

  condition {
    host_header {
      values = ["gl-be.metabets.vip"]
    }
  }
}

// GAME LOBBY PORT 80 LISTENER
resource "aws_lb_listener" "gl-80-listener" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg.arn
  }
}

// GAME LOBBY LISTENER RULE for FE
resource "aws_lb_listener_rule" "gl-80-listener-rule" {
  listener_arn = aws_lb_listener.gl-80-listener.arn
  priority     = 1

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg.arn
  }

  condition {
    host_header {
      values = ["metabets.vip"]
    }
  }
}

// GAME LOBBY LISTENER RULE FOR BE
resource "aws_lb_listener_rule" "gl-80-listener-rule-2" {
  listener_arn = aws_lb_listener.gl-80-listener.arn
  priority     = 2

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg2.arn
  }

  condition {
    host_header {
      values = ["gl-be.metabets.vip"]
    }
  }
}

// BACK OFFICE LB
resource "aws_lb" "alb2" {
  name = "${var.env_name}-${var.project}-BackOffice-LB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id]
  subnets            = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  enable_deletion_protection = false

  tags = {
    Name = "${var.env_name}-${var.project}-BackOffice-LB"
  }
}

// BACK OFFICE FE TG
resource "aws_lb_target_group" "alb2-tg" {
  name       = "${var.env_name}-${var.project}-BO-FE-TG"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-302"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

// BACK OFFICE BO BE TG
resource "aws_lb_target_group" "alb2-tg2" {
  name       = "${var.env_name}-${var.project}-BO-BE-TG"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-302"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

// BACK OFFICE 443 LISTENER
resource "aws_lb_listener" "alb2-listener" {
  load_balancer_arn = aws_lb.alb2.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:824910182745:certificate/3ba2ecd7-4085-4070-8ad0-e6884aea4c9b"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb2-tg.arn
  }
}

// BACK OFFICE LISTENER RULE FOR FE
resource "aws_lb_listener_rule" "host_based_routing3" {
  listener_arn = aws_lb_listener.alb2-listener.arn
  priority     = 3

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb2-tg.arn
  }

  condition {
    host_header {
      values = ["bo-fe.metabets.vip"]
    }
  }
}

// BACK OFFICE LISTENER RULE FOR BE
resource "aws_lb_listener_rule" "host_based_routing4" {
  listener_arn = aws_lb_listener.alb2-listener.arn
  priority     = 4

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb2-tg2.arn
  }

  condition {
    host_header {
      values = ["bo-be.metabets.vip"]
    }
  }
}

// BACK OFFICE PORT 80 LISTENER
resource "aws_lb_listener" "bo-80-listener" {
  load_balancer_arn = aws_lb.alb2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb2-tg.arn
  }
}

// GAME LOBBY LISTENER RULE for FE
resource "aws_lb_listener_rule" "bo-80-listener-rule" {
  listener_arn = aws_lb_listener.bo-80-listener.arn
  priority     = 1

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb2-tg.arn
  }

  condition {
    host_header {
      values = ["bo-fe.metabets.vip"]
    }
  }
}

// GAME LOBBY LISTENER RULE FOR BE
resource "aws_lb_listener_rule" "bo-80-listener-rule-2" {
  listener_arn = aws_lb_listener.bo-80-listener.arn
  priority     = 2

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb2-tg2.arn
  }

  condition {
    host_header {
      values = ["bo-be.metabets.vip"]
    }
  }
}


// JobProc  LB
resource "aws_lb" "alb3" {
  name = "${var.env_name}-${var.project}-JobProc-LB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg9.id]
  subnets            = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  enable_deletion_protection = false

  tags = {
    Name = "${var.env_name}-${var.project}-JobProc-LB"
  }
}


// JobProc TG
resource "aws_lb_target_group" "alb3-tg" {
  name       = "${var.env_name}-${var.project}-JP-TG"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.vpc.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-302"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

// JP 443 LISTENER
resource "aws_lb_listener" "alb3-listener" {
  load_balancer_arn = aws_lb.alb3.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:824910182745:certificate/275b4225-93c5-475c-a172-b19b8df4f2c0"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb3-tg.arn
  }
}

// JP LISTENER RULE 443
resource "aws_lb_listener_rule" "host_based_routing5" {
  listener_arn = aws_lb_listener.alb3-listener.arn
  priority     = 1

 action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb3-tg.arn
  }

  condition {
    host_header {
      values = ["jobproc.metabets.vip"]
    }
  }
}

// JP LISTENER RULE 80
resource "aws_lb_listener" "jp-80-listener" {
  load_balancer_arn = aws_lb.alb3.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb3-tg.arn
  }
}
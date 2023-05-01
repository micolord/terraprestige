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

resource "aws_lb_listener" "alb1-listener" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb1-tg.arn
  }
}

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


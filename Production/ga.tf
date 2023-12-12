// BACK OFFICE GA
resource "aws_globalaccelerator_accelerator" "ga" {
  name = "${var.env_name}-${var.project}-ga-bo"

}

resource "aws_globalaccelerator_listener" "ga-listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga.id
  protocol        = "TCP"

  port_range {
    from_port = 443
    to_port   = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp" {
  listener_arn = aws_globalaccelerator_listener.ga-listener.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb2.arn
    weight      = 100

  client_ip_preservation_enabled = true  
  }
}

resource "aws_globalaccelerator_listener" "ga-listener-80" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga.id
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp-80" {
  listener_arn = aws_globalaccelerator_listener.ga-listener-80.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb2.arn
    weight      = 100

  client_ip_preservation_enabled = true  
  }
}

// GAME LOBBY GA
resource "aws_globalaccelerator_accelerator" "ga2" {
  name = "${var.env_name}-${var.project}-ga-gl"

}

resource "aws_globalaccelerator_listener" "ga-listener2" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga2.id
  protocol        = "TCP"

  port_range {
    from_port = 443
    to_port   = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp2" {
  listener_arn = aws_globalaccelerator_listener.ga-listener2.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb1.arn
    weight      = 100

  client_ip_preservation_enabled = true  
  }
}


resource "aws_globalaccelerator_listener" "ga-listener2-80" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga2.id
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp2-80" {
  listener_arn = aws_globalaccelerator_listener.ga-listener2-80.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb1.arn
    weight      = 100

  client_ip_preservation_enabled = true  
  }
}

// JP GA
resource "aws_globalaccelerator_accelerator" "ga3" {
  name = "${var.env_name}-${var.project}-ga-jp"

}

resource "aws_globalaccelerator_listener" "ga-listener3" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga3.id
  protocol        = "TCP"

  port_range {
    from_port = 443
    to_port   = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp3" {
  listener_arn = aws_globalaccelerator_listener.ga-listener3.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb3.arn
    weight      = 100

  client_ip_preservation_enabled = true  
  }
}


resource "aws_globalaccelerator_listener" "ga-listener3-80" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga3.id
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp3-80" {
  listener_arn = aws_globalaccelerator_listener.ga-listener3-80.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb3.arn
    weight      = 100

  client_ip_preservation_enabled = true  
  }
}
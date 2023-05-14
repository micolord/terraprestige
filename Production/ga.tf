resource "aws_globalaccelerator_accelerator" "ga" {
  name = "${var.env_name}-${var.project}-ga"

}

resource "aws_globalaccelerator_listener" "ga-listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga.id
  #client_affinity = "SOURCE_IP"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga-endpoint-grp" {
  listener_arn = aws_globalaccelerator_listener.ga-listener.id

  endpoint_configuration {
    endpoint_id = aws_lb.alb2.arn
    weight      = 100
  }
}
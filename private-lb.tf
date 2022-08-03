resource "aws_lb" "private" {
  name               = "${var.PROJECT}-${var.ENV}-alb-private"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.private-sg.id]
  subnets            = var.PRIVATE_SUBNET_IDS

  tags = {
    Environment = "${var.PROJECT}-${var.ENV}-alb-private"
  }
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.private.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}


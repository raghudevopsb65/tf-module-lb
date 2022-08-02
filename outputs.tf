output "PRIVATE_LB_ARN" {
  value = aws_lb.private.arn
}

output "PUBLIC_LB_ARN" {
  value = aws_lb.public.arn
}



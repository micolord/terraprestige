output "vpc_id" {
  description = "The aws id assigned to the vpc"
  value       = aws_vpc.vpc.id
}
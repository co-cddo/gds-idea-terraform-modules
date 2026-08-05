output "name" {
  value       = aws_ecr_repository.this.name
  description = "ECR repository name"
}

output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "ECR repository url"
}

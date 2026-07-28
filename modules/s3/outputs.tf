output "name" {
  value       = aws_s3_bucket.this.id
  description = "S3 bucket name"
}

output "arn" {
  value       = aws_s3_bucket.this.arn
  description = "S3 bucket arn"
}

output "kms_arn" {
  value       = length(aws_kms_key.this) > 0 ? aws_kms_key.this[1].arn : null
  description = "Bucket encryption KMS key"
}

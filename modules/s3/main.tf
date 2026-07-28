data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "this" {
  bucket = var.name

  tags = {
    Owner = var.owner
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_policy" "this" {
  count = var.policy != "" ? 1 : 0

  bucket = aws_s3_bucket.this.id
  policy = var.policy
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id = "delete-old-files"

    filter {
    }

    expiration {
      days = var.lifecycle_delete_days
    }

    status = var.lifecycle_delete_days == 0 || var.versioning ? "Disabled" : "Enabled"
  }

  rule {
    id = "delete-incomplete-multipart-upload"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

    expiration {
      expired_object_delete_marker = true
    }

    filter {
    }

    status = "Enabled"
  }

  rule {
    id = "expire-old-files"

    filter {
    }

    noncurrent_version_expiration {
      newer_noncurrent_versions = 10
      noncurrent_days           = var.lifecycle_delete_days == 0 ? 1 : var.lifecycle_delete_days
    }

    status = var.lifecycle_delete_days == 0 || var.versioning == false ? "Disabled" : "Enabled"
  }

}

resource "aws_s3_bucket_notification" "this" {
  bucket      = aws_s3_bucket.this.id
  eventbridge = var.eventbridge_notifications

  dynamic "lambda_function" {
    for_each = var.lambda_functions_notifications
    content {
      lambda_function_arn = each.value.lambda_function_arn
      events              = each.value.events
      filter_prefix       = each.value.filter_prefix
      filter_suffix       = each.value.filter_suffix
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_logging" "this" {
  count = var.s3_bucket_logging != "" ? 1 : 0

  bucket = aws_s3_bucket.this.id

  target_bucket = var.s3_bucket_logging
  target_prefix = "${var.name}/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count = var.server_side_encryption ? 1 : 0

  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.this[1].arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "this" {
  count = var.server_side_encryption ? 1 : 0

  description             = "S3 bucket encryption KMS key"
  enable_key_rotation     = true
  deletion_window_in_days = 20

  tags = {
    Owner = var.owner
  }
}

resource "aws_kms_key_policy" "this" {
  count = var.server_side_encryption ? 1 : 0

  key_id = aws_kms_key.this[1].id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "S3Encryption"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action   = "kms:*"
        Resource = "*"
      }
    ]
  })
}

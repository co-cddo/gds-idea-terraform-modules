variable "owner" {
  description = "Tag 'Owner' added to resources"
  type        = string
}

variable "name" {
  description = "S3 bucket name"
  type        = string
}

variable "policy" {
  description = "Bucket policy in json format"
  type        = string
  default     = ""
}

variable "lifecycle_delete_days" {
  description = "Number of days after which to delete old files. If set to '0' files won't be removed"
  type        = number
  default     = 0
}

variable "newer_noncurrent_versions" {
  description = "Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer"
  type        = number
  default     = 10
}

variable "eventbridge_notifications" {
  description = "Enable eventbridge notifications"
  type        = bool
  default     = false
}

variable "versioning" {
  description = "Enable bucket versioning"
  type        = bool
  default     = false
}

variable "lambda_functions_notifications" {
  description = "Lambda functions notifications"
  type = map(object({
    lambda_function_arn = string,
    events              = optional(list(string), ["s3:ObjectCreated:*"]),
    filter_prefix       = optional(string, null),
    filter_suffix       = optional(string, null),
  }))
  default = {}
}

variable "s3_bucket_logging" {
  description = "S3 bucket logging name"
  type        = string
  default     = ""
}

variable "server_side_encryption" {
  description = "Enable KMS server side encryption for bucket"
  type        = bool
  default     = false
}

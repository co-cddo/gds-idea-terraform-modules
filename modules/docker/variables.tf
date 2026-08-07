variable "repository_url" {
  type        = string
  description = "ECR repository url"
}

variable "tag_name" {
  type        = string
  description = "Docker image tag name"
}

variable "build_context" {
  type        = string
  description = "Docker image build context path"
}

variable "build_dockerfile" {
  type        = string
  description = "Docker image build dockerfile path"
}

variable "build_args" {
  type        = map(string)
  description = "Docker image build arguments"
}

variable "build_platform" {
  type        = string
  description = "Docker image build platform"
  default     = "linux/amd64"
}

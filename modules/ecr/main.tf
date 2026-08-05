resource "aws_ecr_repository" "this" {
  #checkov:skip=CKV_AWS_163: "Ensure ECR image scanning on push is enabled"
  #checkov:skip=CKV_AWS_136: "Ensure that ECR repositories are encrypted using KMS"
  #checkov:skip=CKV_AWS_51: "Ensure ECR Image Tags are immutable"

  name = var.name

  tags = {
    Owner = var.owner
  }
}

data "aws_ecr_lifecycle_policy_document" "this" {
  rule {
    priority    = 1
    description = "Remove untagged images."

    selection {
      tag_status   = "untagged"
      count_type   = "sinceImagePushed"
      count_unit   = "days"
      count_number = 1
    }

    action {
      type = "expire"
    }
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = data.aws_ecr_lifecycle_policy_document.this.json
}

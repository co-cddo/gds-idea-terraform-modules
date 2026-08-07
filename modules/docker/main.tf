data "aws_ecr_authorization_token" "this" {}

resource "docker_registry_image" "this" {
  name = "${var.repository_url}:${var.tag_name}"

  auth_config {
    address  = data.aws_ecr_authorization_token.this.proxy_endpoint
    username = data.aws_ecr_authorization_token.this.user_name
    password = data.aws_ecr_authorization_token.this.password
  }

  build {
    context    = var.build_context
    dockerfile = var.build_dockerfile
    build_args = var.build_args
    platform   = var.build_platform

    use_legacy_builder = false
  }

}

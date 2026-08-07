ephemeral "aws_ecr_authorization_token" "this" {}

provider "docker" {
  registry_auth {
    address  = ephemeral.aws_ecr_authorization_token.this.proxy_endpoint
    username = ephemeral.aws_ecr_authorization_token.this.user_name
    password = ephemeral.aws_ecr_authorization_token.this.password
  }
  #host = "unix:///Users/${user_name}/.colima/docker.sock"
}

resource "docker_registry_image" "this" {
  name = "${var.repository_url}:${var.tag_name}"

  build {
    context    = var.build_context
    dockerfile = var.build_dockerfile
    build_args = var.build_args
    platform   = var.build_platform

    use_legacy_builder = false
  }

}

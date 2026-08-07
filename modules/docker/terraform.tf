terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4"
    }
  }
}

output "name" {
  value       = docker_registry_image.this.sha256_digest
  description = "The name of the Docker image."
}

output "sha256_digest" {
  value       = docker_registry_image.this.sha256_digest
  description = "The sha256 digest of the image."
}

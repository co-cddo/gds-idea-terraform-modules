output "main_team_id" {
  value       = github_team.main.id
  description = "Main team id"
}

output "subteams_ids" {
  value       = { for key, value in github_team.subteams : key => value.id }
  description = "Subteams ids"
}

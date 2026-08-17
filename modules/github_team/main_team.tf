resource "github_team" "main" {
  name        = var.main_team_name
  description = var.main_team_description
  privacy     = "closed"
}

resource "github_team_members" "main_members" {
  team_slug = github_team.main.slug

  dynamic "members" {
    for_each = var.main_members
    content {
      username = lower(members.key)
      role     = members.value
    }
  }
}

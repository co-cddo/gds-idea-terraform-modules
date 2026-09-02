resource "github_team" "subteams" {
  for_each = var.subteams

  name           = each.value.name
  description    = each.value.description
  privacy        = "closed"
  parent_team_id = github_team.main.id
}

resource "github_team_members" "subteams" {
  for_each = { for key, value in var.subteams : key => value if length(value.members) != 0 }

  team_slug = github_team.subteams[each.key].slug

  dynamic "members" {
    for_each = each.value.members
    content {
      username = lower(members.key)
      role     = members.value
    }
  }
}

variable "main_team_name" {
  description = "Main team name"
  type        = string
}

variable "main_team_description" {
  description = "Main team description"
  type        = string
}

variable "main_members" {
  description = "Main team memebers"
  type        = map(string)
}

variable "subteams" {
  description = "Subteams configuration"
  type = map(object({
    name        = string
    description = string
    members     = map(string)
    }
  ))
}

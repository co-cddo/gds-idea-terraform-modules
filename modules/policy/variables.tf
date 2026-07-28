variable "owner" {
  description = "Tag 'Owner' added to resources"
  type        = string
}

variable "name" {
  type        = string
  description = "Policy name"
}

variable "statements" {
  type = list(object({
    sid       = optional(string, null)
    effect    = string
    actions   = list(string)
    resources = list(string)
    condition = optional(object({
      test     = string
      variable = string
      values   = list(string)
    }), null)
  }))
  description = "Policy statements"
}

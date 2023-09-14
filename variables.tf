variable orgs { 
    description = "Atributes of the Github parent teams which are used to imitate organisations"
    type = list(object({
    name        = string
    description = string
    privacy     = string
  }))
}

variable teams {
    description = "Atributes of the Github child teams"
    type = list(object({
    name            = string
    description     = string
    privacy         = string
    org_membership  = string
  }))
}

variable repos {
  description = "contains the repository objects"
  type = list(object({
    name = string
    description = string
  }))
}

variable "repos_ownership" {
  type = map(list(object({
    repo_name   = string
    permission  = string
  })))
  description = "Mapping of teams to repositories and permissions"
}
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

variable teams {
    description = "Atributes of the Github child teams"
    type = any
}
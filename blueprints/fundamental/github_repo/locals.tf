locals {
  repos_ownership_mapping = flatten([
    for team, value in var.repos_ownership : [
      for repo in value : {
        "team"       = team
        "repo"       = repo.repo_name
        "permission" = repo.permission
      }
    ]
  ])
}


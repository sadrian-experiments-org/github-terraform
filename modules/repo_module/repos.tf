resource "github_repository" "repositories" {
  for_each = {
    for repo in local.repos_data.repos :
    repo.name => repo
  }

  name        = each.value.name
  description = each.value.description
}

resource "github_team_repository" "sub_team_repositories" {
  for_each = {
    for repo in local.repos_data.repos :
    repo.name => repo
  }

  team_id = var.sub_teams[each.value.team].id

  repository = github_repository.repositories[each.value.name].name
  permission = "push"
}

resource "github_team_repository" "main_team_repositories" {
  for_each = {
    for repo in local.repos_data.repos :
    repo.name => repo
  }

  team_id = var.sub_teams[each.value.team].parent_team_id

  repository = github_repository.repositories[each.value.name].name
  permission = "push"
}




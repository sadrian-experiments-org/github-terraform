resource "github_repository" "repositories" {
  for_each = {
    for repo in var.repos :
    repo.name => repo
  }

  name        = each.key
  description = each.value.description
}

resource "github_team_repository" "team_repos" {
  for_each = {
    for map_object in local.repos_ownership_mapping:
    "${map_object.team}-${map_object.repo}" => map_object
  }

  team_id    = var.teams[each.value.team].id
  repository = each.value.repo
  permission = each.value.permission
}


# "FE Development Team": {repos: [{repo_name: blabla, permission: blabla},{repo_name: blabla, permission: blabla}] }
# "FE Development Team": [{repo_name: blabla, permission: blabla}, {repo_name: blabla, permission: blabla}]  

# resource "github_team_repository" "main_team_repositories" {
#   for_each = {
#     for repo in local.repos_data.repos :
#     repo.name => repo
#   }

#   team_id = var.sub_teams[each.value.team].parent_team_id

#   repository = github_repository.repositories[each.value.name].name
#   permission = "push"
# }




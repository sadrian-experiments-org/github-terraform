resource "github_team" "main_teams" {

  for_each = {
    for team in local.teams_data.teams :
    team.name => team
  }

  name                      = each.value.name
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = true
}

resource "github_team" "sub_teams" {

  for_each = {
    for sub_team in local.teams_data.sub_teams :
    sub_team.name => sub_team
  }

  name                      = each.value.name
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = true
  parent_team_id            = github_team.main_teams[each.value.parent_team_name].id

}

# output "sub_teams_ids" {
#   value = { for key, value in github_team.sub_teams : key => value.id }
# }

output "sub_teams" {
  value = github_team.sub_teams
}
output "main_teams" {
  value = github_team.main_teams  
}


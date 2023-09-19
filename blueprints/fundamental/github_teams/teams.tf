resource "github_team" "orgs" {

  for_each = {
    for org in var.orgs :
    org.name => org
  }

  name                      = each.key
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = true
}

resource "github_team" "teams" {

  for_each = {
    for team in var.teams :
    team.name => team
  }

  name                      = each.key
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = true
  parent_team_id            = github_team.orgs[each.value.org_membership].id

}
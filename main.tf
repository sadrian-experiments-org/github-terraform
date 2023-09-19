provider "github" {}

# Retrieve information about the currently (PAT) authenticated user
data "github_user" "self" {
  username = ""
}

module "teams" {
    source = "./blueprints/fundamental/github_repo"
    orgs = local.team_module_vars.orgs
    teams = local.team_module_vars.teams
}

module "repos" {
    source = "./blueprints/fundamental/github_teams"
    repos = local.repo_module_vars.repos
    repos_ownership = local.repo_module_vars.repos_ownership
    teams = module.teams.teams
}
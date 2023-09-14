provider "github" {}

# Retrieve information about the currently (PAT) authenticated user
data "github_user" "self" {
  username = ""
}

module "teams" {
    source = "./modules/teams_module"
    orgs = var.orgs
    teams = var.teams  
}

module "repos" {
    source = "./modules/repo_module"
    repos = var.repos
    repos_ownership = var.repos_ownership
    teams = module.teams.teams
}
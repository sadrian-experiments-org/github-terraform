provider "github" {}

# Retrieve information about the currently (PAT) authenticated user
data "github_user" "self" {
  username = ""
}

module "teams" {
    source = "./modules/teams_module"  
}

module "repos" {
    source = "./modules/repo_module"
    sub_teams = module.teams.sub_teams
    main_teams = module.teams.main_teams
}
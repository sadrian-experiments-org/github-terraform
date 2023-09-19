locals {
  repo_module_vars = jsondecode(file("${path.module}/data/repos_module.json"))
  team_module_vars = jsondecode(file("${path.module}/data/team_module.json"))
}

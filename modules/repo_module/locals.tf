locals {
  repos_data = jsondecode(file("${path.module}/repos.json"))

}

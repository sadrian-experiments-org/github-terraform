locals {
  teams_data = jsondecode(file("${path.module}/teams.json"))

}

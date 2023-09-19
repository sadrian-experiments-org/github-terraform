variable orgs { 
    description = "Atributes of the Github parent teams which are used to imitate organisations"
    type = list(object({
    name        = string
    description = string
    privacy     = string
  }))
}

variable teams {
    description = "Atributes of the Github child teams"
    type = list(object({
    name            = string
    description     = string
    privacy         = string
    org_membership  = string
  }))
}
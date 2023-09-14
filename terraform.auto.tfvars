orgs = [
    {
        "name": "Security Org",
        "description": "Security Org [Learn TF]",
        "privacy": "closed"
    },
    {
        "name": "Development Org",
        "description": "Development Org [Learn TF]",
        "privacy": "closed"
    }
]

teams = [
    {
        "name": "FE Development Team",
        "description": "FE Developer Team [Learn TF]",
        "privacy": "closed",
        "org_membership": "Development Org"
    },
    {
        "name": "BE Development Team",
        "description": "BE Developer Team [Learn TF]",
        "privacy": "closed",
        "org_membership": "Development Org"
    }
]

repos = [
   {
        "name": "React_App",
        "description": "FE repo",
   },
   {
        "name": "Python_Flask",
        "description": "BE repo",
   }
]

repos_ownership = {
    "FE Development Team":[
        {
            "repo_name": "React_App",
            "permission": "push"
        },
        {
            "repo_name": "Python_Flask",
            "permission": "pull"
        }
    ],
    "BE Development Team":[
        {
            "repo_name": "React_App",
            "permission": "pull"
        },
        {
            "repo_name": "Python_Flask",
            "permission": "push"
        }
    ]
}
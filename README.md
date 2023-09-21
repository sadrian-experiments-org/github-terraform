To add a plugin edit plugins.json and create an object in which you specify:
- `name`
- `source`

**Example:**

```json
    "plugins":[
        {
        "name": "github_repo",
        "source": "github.com/sadrian-experiments-org/modules"
        },
        {
        "name": "github_teams",
        "source": "github.com/sadrian-experiments-org/teams"
        }
    ]
```
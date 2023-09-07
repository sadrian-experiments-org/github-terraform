### Local setup

a. [Create a Github personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with the following permissions: repo, admin:org, delete_repo.

b. [Create a Github organization](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch). If you do not specify a Github organization, Terraform will authenticate and manage resources on the access token user's individual user account.

c. Export the 2 values as local variables:
```sh
export GITHUB_TOKEN=<github_token>
export GITHUB_OWNER=<github_organization>
```

d. Initialize the configuration.
```sh
terraform init
```

e. Apply the changes.
```sh
terraform apply
```

# Training Terraform

## Methodo
Initialization:
- Init File Tree
- Init git repo (git init, git commit)
- Init Terraform project (terrform init)

For each component :
- update main.tf
- terraform plan
- terraform fmt
- terraform validate
- terraform apply

# File tree
- Repo
  - /.git
  - .gitignore
  - /CoreInfra
    - input.tf
    - main.tf
    - output.tf
    - terraform.tfstate
    - terraform.tfstate.backup

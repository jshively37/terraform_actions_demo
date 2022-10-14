## GitHub Action using Terraform Cloud

GitHub action using Terraform Cloud as the backend.

## High Level Diagram

![tfcb_digram](images/workflow.jpeg)


## Workflow

### Feature Requests

The user will create a feature branch and make changes. As they commit to the feature branch, GitHub actions will run a terraform validate and plan.

![feature_request](images/feature_request.jpeg)

### Merge into main

Once the user is happy with their feature request, they will create a pull request to merge the changes into the main branch.

Upon approval of the pull request, a Terraform apply runs to ensure continuous development.

![main_pr](images/pr_main.jpeg)

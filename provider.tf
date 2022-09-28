terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.32.0"
    }
  }

  cloud {
    organization = "jshively_hashi"

    workspaces {
      name = "github_action_demo"
    }
  }
}

provider "aws" {
  region = var.region
}

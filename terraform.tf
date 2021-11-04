terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "sca-workflow"

        workspaces {
        name = "workflow_practice"
        }
    }
}

provider "google" {
    project = var.project
    region = var.region
}
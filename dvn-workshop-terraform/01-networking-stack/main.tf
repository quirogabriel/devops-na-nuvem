terraform {
  // backend configuration for remote state management using AWS S3 and DynamoDB for state locking
  backend "s3" {
    // The name of the S3 bucket where the Terraform state file will be stored
    bucket = "capco-teste-tecnico-remote-backend-bucket"
    // The key (path) within the S3 bucket where the Terraform state file will be stored for versioning and organization
    key          = "networking/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    // The name of the DynamoDB table used for state locking to prevent concurrent modifications
    # dynamodb_table = "capco-teste-tecnico-state-locking-table"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.assume_role.region

  default_tags {
    tags = var.default_tags
  }

  assume_role {
    role_arn = var.assume_role.arn
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAYGU4YK33JITYGGND"
  secret_key = "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"
}

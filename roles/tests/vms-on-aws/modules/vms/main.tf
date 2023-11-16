terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "~> 4.35"
    }
    tls = {
      source  = "tls"
      version = "~> 2.1"
    }
    template = {
      source  = "template"
      version = "~> 2.1"
    }
    random = {
      source  = "random"
      version = "~> 2.2"
    }
  }
}

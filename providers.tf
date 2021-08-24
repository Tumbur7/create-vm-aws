terraform {
  required_version = "= 0.13.5"
}

provider "aws" {
  version = "~> 2.66"
  region = "ap-southeast-1"
}

provider "random" {
  version = "~> 2.2"
}
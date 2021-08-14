provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = pathexpand("/opt/workspace/.aws/credentials")
  profile                 = "default"
}

module "atlantis" {
  source  = "ringanta/ec2-atlantis/aws"
  version = "1.0.0"

  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnyuqYlhMYxiSq4L/ZOUc9i3JVq3qWCr5tIfV7F6wFdvOE/bUy/u1UHlwJjapiAibnAK1SHQGk4cHm2jCLCTBICZTvoe0kJyRci7f5t5VpoaaE3AzK4uGIIyAsyZMp20SYa48avGuKBbBdUtUrQYiCMa1WsHJBXCaMbDGpE9KFqdvkHbHRpK1dkZX8SGckTWTjqp8W9dPUIMH7xYWblZYTjzYVQznFR0/kgzt6IkeYM0zPcVDW0jdAXdxUI0iBtG1+Yn+ZFYX3N65xjAQDsyM5wa2QtepAYE+w30lMJPtZw9VqXlAVDP65fa/leqrgsNbOeKjn2m+whgXAQRQ4mM/t tumbur@Tumburs-MacBook-Pro.local"
  attach_admin_policy = true
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-s3-tumbur"

  versioning {
    enabled = true
  }

}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-tumbur"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
variable "default_tags" {
  type = object({
    Project     = string
    Environment = string
  })

  default = {
    Project     = "capco-teste-tecnico"
    Environment = "production"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::758862194321:role/capco-teste-tecnico-vpc"
    region = "us-east-1"
  }
}

variable "remote_backend" {
  type = object({
    dynamo_table_name          = string
    dynamo_table_billing_mode  = string
    dynamo_table_hash_key      = string
    dynamo_table_hash_key_type = string
    bucket_name                = string
  })

  default = {
    dynamo_table_name          = "capco-teste-tecnico-state-locking-table"
    dynamo_table_billing_mode  = "PAY_PER_REQUEST"
    dynamo_table_hash_key      = "LockID"
    dynamo_table_hash_key_type = "S"
    bucket_name                = "capco-teste-tecnico-remote-backend-bucket"
  }
}

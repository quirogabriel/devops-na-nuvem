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

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
    private_subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
  })

  default = {
    name                     = "capco-teste-tecnico-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "capco-teste-tecnico-igw"
    nat_gateway_name         = "capco-teste-tecnico-ngw"
    public_route_table_name  = "capco-teste-tecnico-public-rt "
    private_route_table_name = "capco-teste-tecnico-private-rt"
    public_subnets = [
      {
        name              = "capco-teste-tecnico-vpc-public-subnet-us-east-1a"
        cidr_block        = "10.0.0.0/26"
        availability_zone = "us-east-1a"
      },
      {
        name              = "capco-teste-tecnico-vpc-public-subnet-us-east-1b"
        cidr_block        = "10.0.0.64/26"
        availability_zone = "us-east-1b"
      },
    ]
    private_subnets = [
      {
        name              = "capco-teste-tecnico-vpc-private-subnet-us-east-1a"
        cidr_block        = "10.0.0.128/26"
        availability_zone = "us-east-1a"
      },
      {
        name              = "capco-teste-tecnico-vpc-private-subnet-us-east-1b"
        cidr_block        = "10.0.0.192/26"
        availability_zone = "us-east-1b"
      },
    ]
  }
}

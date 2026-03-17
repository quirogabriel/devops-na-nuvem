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

variable "eks_cluster" {
  type = object({
    name                                   = string
    version                                = string
    access_config_authentication_mode      = string
    node_group_name                        = string
    node_group_capacity_type               = string
    node_group_instance_types              = list(string)
    node_group_scaling_config_desired_size = number
    node_group_scaling_config_max_size     = number
    node_group_scaling_config_min_size     = number
  })

  default = {
    name                                   = "capco-teste-tecnico-eks-cluster"
    version                                = "1.31"
    access_config_authentication_mode      = "API_AND_CONFIG_MAP"
    node_group_name                        = "capco-teste-tecnico-eks-cluster-ng"
    node_group_capacity_type               = "ON_DEMAND"
    node_group_instance_types              = ["t3.medium"]
    node_group_scaling_config_desired_size = 2
    node_group_scaling_config_max_size     = 2
    node_group_scaling_config_min_size     = 2
  }
}

variable "ecr_repositories" {
  type = list(string)

  default = [ "dvn-workshop-jan/production/frontend", "dvn-workshop-jan/production/backend" ]
}
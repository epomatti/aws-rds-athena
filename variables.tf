variable "aws_region" {
  type    = string
  default = "us-east-2"
}

### RDS ###
variable "rds_instance_class" {
  type    = string
  default = "db.t4g.small"
}

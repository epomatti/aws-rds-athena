# resource "aws_serverlessapplicationrepository_cloudformation_stack" "postgres-rotator" {
#   name           = "postgres-rotator"
#   application_id = "arn:aws:serverlessrepo:us-east-1:297356227824:applications/SecretsManagerRDSPostgreSQLRotationSingleUser"
#   capabilities = [
#     "CAPABILITY_IAM",
#     "CAPABILITY_RESOURCE_POLICY",
#   ]
#   parameters = {
#     functionName = "func-postgres-rotator"
#     endpoint     = "secretsmanager.${data.aws_region.current.name}.${data.aws_partition.current.dns_suffix}"
#   }
# }

# data "aws_partition" "current" {}
# data "aws_region" "current" {}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_security_group" "allow_postgresql" {
  name   = "lambda-connector-athena"
  vpc_id = var.vpc_id

  tags = {
    Name = "sg-lambda-connector-athena"
  }
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_postgresql.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [data.aws_vpc.selected.cidr_block]
  security_group_id = aws_security_group.allow_postgresql.id
}

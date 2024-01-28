output "lambda_federated_postgresql_connection_string" {
  value = "postgres://jdbc:${module.database.connection_string}"
}

output "bucket_name" {
  value = module.athena.bucket_name
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet" {
  value = module.vpc.public_subnet
}

output "security_group_id" {
  value = module.lambda_connector.security_group_id
}

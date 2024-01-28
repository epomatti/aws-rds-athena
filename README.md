# AWS RDS Athena

Querying RDS in a private VPC from Athena.

Create the variables file set the values:

```sh
cp config/template.tfvars .auto.tfvars
```

Create the resources:

```sh
terraform init
terraform apply -auto-approve
```

In Athena, create a [PostgreSQL Lambda connector][1].

The connection string will look something like this:

```
postgres://jdbc:postgresql://<HOST>:5432/athenadb?user=athena&password=p4ssw0rd
```

[1]: https://docs.aws.amazon.com/athena/latest/ug/connectors-postgresql.html

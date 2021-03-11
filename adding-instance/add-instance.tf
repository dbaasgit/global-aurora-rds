provider "aws" {
  alias  = "secondary"
  region = "us-east-1"
}

resource "aws_rds_cluster_instance" "secondary" {
  provider                  = "aws.secondary"
  identifier                = "db-instance-primary-us-east-1"
 # source_db_cluster_identifier ="db-cluster-primary-us-east-2"
  cluster_identifier        = "secondary-cluster-us-east-1"
  instance_class            = "db.r5.large"
  engine                    = "aurora-postgresql"
  engine_version            = "11.9"
  db_subnet_group_name      = "default"
}

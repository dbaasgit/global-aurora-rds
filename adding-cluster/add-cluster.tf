provider "aws" {
  alias  = "secondary"
  region = "us-east-1"
}

resource "aws_rds_cluster" "secondary" {
  provider                  = "aws.secondary"
  cluster_identifier        = "secondary-cluster-us-east-1"
  global_cluster_identifier = "global_database_us-east-2"
  engine                    = "aurora-postgresql"
  engine_version            = "11.9"
  #username                  = "dminpgsql"
  #password                  = "admin1234"
  skip_final_snapshot       = true
  vpc_security_group_ids = ["sg-03558f08f49052eb1"]
}

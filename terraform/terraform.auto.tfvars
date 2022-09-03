region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"
#ubuntu is sonar 
ami-sonar = "ami-04a1383f2a46bdaa5"

ami-bastion = "ami-0aa17550cbba02be3"

ami-nginx = "ami-01291bbea1c72459c"

ami-web = "ami-0ad2ed2f960d85749"

keypair = "project16"

master-password = "bennypbl"

master-username = "benny"

account_no = "032051391204"

tags = {
  Owner-Email     = "benita201987@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "032051391204"
}
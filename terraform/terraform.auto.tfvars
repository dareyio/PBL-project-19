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
ami-sonar = "ami-0292143ada1ebdaa1"

ami-bastion = "ami-0d2dc78b159a5ae97"

ami-nginx = "ami-02f8d68458eb1e06a"

ami-web = "ami-047edab2f2e02dc1b"

keypair = "fubi"

master-password = "bennypbl"

master-username = "benny"

account_no = "370612617815"

tags = {
  Owner-Email     = "bennylove550@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "370612617815"
}
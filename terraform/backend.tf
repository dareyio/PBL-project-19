# terraform {
#   backend "s3" {
#     bucket         = "pbl-test-18"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }


#Terraform-Cloud-P19 is the name of workspace i craeted in Terraform cloud
terraform {
  backend "remote" {
    organization = "pisitis"

    workspaces {
      name = "Terraform-Cloud-P19"
    }
  }
}
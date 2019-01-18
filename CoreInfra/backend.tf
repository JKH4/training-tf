terraform {
  backend "s3" {
    bucket = "training-tf"
    key    = "CoreInfra/terraform.tfstate"
    region = "eu-west-1"
    # dynamodb_table = "training-tf-coreinfra"
  }
}
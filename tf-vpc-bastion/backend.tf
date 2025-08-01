terraform {
  backend "s3" {
    bucket         = "tf-mpn-state-storage"
    key            = "bastion-host/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-mpn-locks"
    encrypt        = true
  }
}

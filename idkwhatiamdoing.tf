provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "sctp-ce12-tfstate-bucket"   # Change this
    key    = "ce12-mod3_2-zaclim.tfstate" # Change this
    region = "ap-southeast-1"
  }
}

resource "aws_s3_bucket" "s3_tf" {
  #checkov:skip=CKV_AWS_18: Demo bucket does not require access logging
  #checkov:skip=CKV_AWS_21: Demo bucket does not require versioning
  #checkov:skip=CKV_AWS_144: Demo bucket does not require cross-region replication
  #checkov:skip=CKV_AWS_145: Demo bucket does not require KMS encryption
  #checkov:skip=CKV2_AWS_61: Demo bucket does not require lifecycle configuration
  #checkov:skip=CKV2_AWS_62: Demo bucket does not require event notification
  #checkov:skip=CKV2_AWS_6: Demo bucket does not require public access block configuration for this lab

  bucket_prefix = "zac-lim" # Set your bucket name here
}


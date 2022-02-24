terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
}

provider "aws" {
  profile = "backup"
  region = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
}

resource "aws_s3_bucket_public_access_block" "bucket_pub_access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.60.0"
        }
    }
    backend "s3" {
        bucket = "terraform-state-bucket-abiera"
        key = "test.tfstate"
        region = "ap-southeast-1"
    }
}
resource "aws_s3_bucket" "test-bucket" {
    bucket = "test-s3-bucket-for-proton-abiera-${var.environment.inputs.test-env-value}"
}

output "bucket_name" {
  value = aws_s3_bucket.test-bucket.id
}
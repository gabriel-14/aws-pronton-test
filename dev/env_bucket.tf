/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-southeast-1:584067744638:environment/dev

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

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
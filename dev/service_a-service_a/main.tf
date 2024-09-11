/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:ap-southeast-1:584067744638:service/service_a/service-instance/service_a

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
        region = "ap-southeast-1"
    }
}

resource "aws_s3_object" "object" {
    key = "${var.service.name}.txt"
    bucket = var.environment.outputs.bucket_name
    content = var.service.content
    tags = {
      "version" : "1"
    }
}
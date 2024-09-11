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
    key = "${var.service_instance.name}.txt"
    bucket = var.environment.outputs.bucket_name
    content = var.service_instance.inputs.content
    tags = {
      "version" : "1"
    }
}
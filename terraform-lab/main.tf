data "aws_vpc" "this"{
    tags = {
        Environment ="dev"
    }
}
module "s3_object" {

    source = "./modules/s3"
    bucket_name = aws_s3_bucket.example.bucket
    file_key = "my first bucket file "
    file_source = "./this-is-my-file.txt"
     
}



resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-lirigzon"

  tags = {
    Name        = "ICK-Training"
    Environment = "Dev"
  }
}


output "vpc_id" {
  value       = data.aws_vpc.this.id
}

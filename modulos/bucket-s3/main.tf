# ---------------------------------------
# Define un bucket S3
# 
resource "aws_s3_bucket" "bucket_ejercicio_terraform" {
  bucket = var.nombre-bucket
  force_destroy = true
  tags = {
    Name        = var.nombre-bucket
  }
}

# -------------------------
# Define el provider de AWS
# -------------------------
provider "aws" {
  region = local.region
}

locals {
  region          = "eu-west-3"
  nombre-bucket = "bucket-terraform-renzo"
}

module "bucket-s3" {
    source = "./modulos/bucket-s3"
    nombre-bucket = local.nombre-bucket

}
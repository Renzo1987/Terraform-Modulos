
# -------------------------
# Define el provider de AWS
# -------------------------
provider "aws" {
  region = local.region
}

locals {
  region          = "eu-west-3"
  nombre_bucket = "bucket_terraform_renzo"
  nombre_dynamodb = "dynamodb_terraform_renzo"
  columna_dynamo = { name="ID", type="N" }
}

# -------------------------
# Define el bucket S3
# -------------------------
module "bucket-s3" {
    source = "./modulos/bucket-s3"
    nombre_bucket = local.nombre_bucket

}

# -------------------------
# Define la dynamoDB
# -------------------------
module "dynamo" {
    source = "./modulos/dynamo"
    nombre_dynamodb = local.nombre_dynamodb
    hash_key = local.columna_dynamo
}
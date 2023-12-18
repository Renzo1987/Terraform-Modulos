# -------------------------
# Define el provider de AWS
# -------------------------
provider "aws" {
  region = local.region
}

locals {
  region          = "eu-west-3"
  nombre-bucket =   "bucket-terraform-renzo"
  nombre_dynamoDB = "dynamodb-terraform-renzo"
  nombre-ec2 =      "instancia-terraform"
  columna_dynamo =  { name="ID", type="N" }
  ami    =          var.ubuntu_ami

}

# -------------------------
# Define el bucket S3
# -------------------------
module "bucket-s3" {
    source = "./modulos/bucket-s3"
    nombre-bucket = local.nombre-bucket

}

# -------------------------
# Define la dynamoDB
# -------------------------
module "dynamo" {
    source = "./modulos/dynamo"
    nombre_dynamoDB = local.nombre_dynamoDB
    hash_key = local.columna_dynamo
}

# -------------------------
# Define la EC2
# -------------------------
module "instancia" {
    source = "./modulos/instancia"
    ami_id = var.ubuntu_ami

    tipo_instancia = "t2.micro"
    puerto_servidor =   var.puerto_servidor
}
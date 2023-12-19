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
  nombre_lambda=    "lambda_terraform"
  columna_dynamo =  { name="ID", type="N" }
  ami    =          var.ubuntu_ami
  runtime_lambda = "python3.11"
  codigo_lambda  = "code.zip"
  permisos_lambda     = ["AmazonDynamoDBFullAccess", "AmazonS3ReadOnlyAccess"]
  handler_nombre = "function.lambda_handler"


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

data "aws_iam_policy" "permisos" {
  count = length(local.permisos_lambda)
  name = local.permisos_lambda[count.index]
}

# -------------------------
# Define la Lambda
# -------------------------
module "lambda" {
  source = "./modulos/lambda"
  nombre_lambda = local.nombre_lambda
  permisos       = [ for permiso in data.aws_iam_policy.permisos : permiso.arn ]
  runtime_lambda = local.runtime_lambda
  codigo  = local.codigo_lambda
  lambda_handler = local.handler_nombre
}

variable "nombre_lambda" {
  description = "Nombre de la Lambda"
  type        = string
}

variable "permisos" {
  description = "Permisos para la lambda"
  type = set(string)
}

variable "lambda_handler" {
  description = "TO DO"
  type = string
}

variable "runtime_lambda"{
  description = "Lenguaje de la funcion"
  type = string
}
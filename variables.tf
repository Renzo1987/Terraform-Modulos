variable "puerto_servidor" {
  description = "Puerto para las instancias EC2"
  type        = number
  default     = 8080
}

variable "ubuntu_ami" {
  description = "AMI por region"
  type        = string
  default = "ami-05b5a865c3579bbc4" # Ubuntu en Paris
  }
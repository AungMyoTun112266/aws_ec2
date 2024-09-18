variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "deployment_name" {
  description = "Deployment name, used to prefix resources"
  type        = string
  default     = ""
}

variable "master_sgp_key" {
  description = "Deployment name, used to prefix resources"
  type        = string
  default     = "master-sgp-key"
}

variable "public_default_subnet" {
  description = "Deployment name, used to prefix resources"
  type        = string
  default     = "subnet-02777557795eebb74"
}

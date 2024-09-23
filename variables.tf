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

variable "create_ec2_ssh_keypair" {
  type        = bool
  description = "Boolean to create EC2 SSH key pair. This is separate from the `bastion_keypair` input variable."
  default     = true
}

variable "friendly_name_prefix" {
  type        = string
  description = "Friendly name prefix used for tagging and naming AWS resources."
  default     = "master-sgp-key"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of common tags for all taggable AWS resources."
  default     = {}
}
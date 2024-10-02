variable "srv" {
  description = "Count of srv nodes"
  type        = number
  default     = 1
}

variable "master" {
  description = "Count of master nodes"
  type        = number
  default     = 1
}

variable "app" {
  description = "Count of app nodes"
  type        = number
  default     = 1
}

variable "instance_family_image" {
  description = "Instance image"
  type        = string
  default     = "ubuntu-2404-lts-oslogin"
}

variable "vpc_subnet_id" {
  description = "VPC subnet network id"
  type        = string
}

variable "ssh_credentials" {
  description = "Credentials for connect to instances"
  type        = object({
    user        = string
    private_key = string
    pub_key     = string
  })
  default     = {
    user        = "ubuntu"
    private_key = "~/.ssh/id_rsa"
    pub_key     = "~/.ssh/id_rsa.pub"
  }
}
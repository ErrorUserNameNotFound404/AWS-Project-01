variable "secret_key" {

}

variable "access_key" {

}

variable "region" {
  description = "Default Region"
  default     = "us-west-2"
}

# EC2 Instance Variables
variable "ami_amz_server" {
  description = "AMI for Amazon Linux Server"
  default     = "ami-07dfed28fcf95241c"
}

variable "ami_ubuntu_server" {
  description = "AMI for Ubuntu Server"
  default     = "ami-03f65b8614a860c29"
}

variable "amz_srv_name" {
  description = "Amazon Server Instance Name tag"
  type        = string
  default = "Amazon_Linux_Server_"
}

variable "ub_srv_name" {
  description = "Ubuntu Server Instance Name tag"
  type = string
  default = "Ubuntu_Linux_Server_"
}

variable "ec2_instance_type" {
  description = "AWS EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Public VPC / Subnet variables
variable "pub_vpc" {
  description = "Public VPC name value"
  type        = string
  default     = "Public_VPC_"
}

variable "pub_vpc_cidr" {
  description = "Public VPC CIDR range value"
  type        = string
  default     = "10.0.0.0/24"
}

variable "pub_subnet_name" {
  description = "Public Subnet name value"
  type        = string
  default     = "Public_Subnet_"
}

variable "pub_subnet_cidr" {
  description = "Public Subnet CIDR range"
  type        = string
  default     = "10.0.0.0/24"
}

# Private VPC / Subnet variables
variable "pri_vpc" {
  description = "Privat VPC name value"
  type        = string
  default     = "Private_VPC_"
}

variable "pri_vpc_cidr" {
  description = "Private VPC CIDR range value"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pri_subnet" {
  description = "Private Subnet name value"
  type        = string
  default     = "Privat_Subnet_"
}

variable "pri_subnet_cidr" {
  description = "Private Subnet CIDR range"
  type        = string
  default     = "10.0.0.0/24"
}
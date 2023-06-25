terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


# AWS Instances
resource "aws_instance" "amz-svr-01" {
  ami           = var.ami_amz_server
  instance_type = var.ec2_instance_type

  tags = {
    Name = "${var.amz_srv_name}01"
  }
}

resource "aws_instance" "amz-svr-02" {
  ami           = var.ami_amz_server
  instance_type = var.ec2_instance_type

  tags = {
    Name = "${var.amz_srv_name}02"
  }
}

resource "aws_instance" "ub-svr-01" {
  ami           = var.ami_ubuntu_server
  instance_type = var.ec2_instance_type

  tags = {
    Name = "${var.ub_srv_name}01"
  }
}

resource "aws_instance" "ub-svr-02" {
  ami           = var.ami_ubuntu_server
  instance_type = var.ec2_instance_type

  tags = {
    Name = "${var.ub_srv_name}02"
  }
}

# AWS Public VPCs
resource "aws_vpc" "pub_vpc_01" {
  cidr_block       = var.pub_vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.pub_vpc}01"
  }
}

resource "aws_vpc" "pub_vpc_02" {
  cidr_block = var.pub_vpc_cidr
  tags = {
    Name = "${var.pub_vpc}02"
  }

}

# AWS Public Subnets
resource "aws_subnet" "pub_subnet_01" {
  vpc_id     = aws_vpc.pri_vpc_01.id
  cidr_block = var.pub_subnet_cidr
  tags = {
    Name = "${var.pub_subnet_name}01"
  }
}

resource "aws_subnet" "pub_subnet_02" {
  vpc_id     = aws_vpc.pri_vpc_02.id
  cidr_block = var.pub_subnet_cidr
  tags = {
    Name = "${var.pub_subnet_name}02"
  }
}

# AWS Private VPCs
resource "aws_vpc" "pri_vpc_01" {
  cidr_block       = var.pri_vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.pri_vpc}01"
  }
}

resource "aws_vpc" "pri_vpc_02" {
  cidr_block       = var.pri_vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.pri_vpc}02"
  }
}

# AWS Private Subnets
resource "aws_subnet" "pri_subnet_01" {
  vpc_id     = aws_vpc.pub_vpc_01.id
  cidr_block = var.pub_subnet_cidr
  tags = {
    Name = "${var.pri_subnet}01"
  }
}

resource "aws_subnet" "pri_subnet_02" {
  vpc_id     = aws_vpc.pub_vpc_02.id
  cidr_block = var.pub_subnet_cidr
  tags = {
    Name = "${var.pri_subnet}02"
  }
}
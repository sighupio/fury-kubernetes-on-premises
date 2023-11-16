variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID where control-plane will run"
}

variable "region" {
  type        = string
  description = "AWS Region where cluster will run"
}

variable "cluster_name" {
  type        = string
  description = "Unique identifier of the cluster."
}

variable "trusted_cidrs" {
  type        = list(any)
  description = "List of allowed cidrs to access the control-plane/cluster"
  default     = ["0.0.0.0/0"]
}

variable "master_instance_type" {
  type        = string
  description = "Instance type used to run Kubernetes control-plane"
  default     = "t3.medium"
}

variable "master_count" {
  type        = number
  description = "Number of master nodes to deploy"
  default     = 3
}

variable "worker_instance_type" {
  type        = string
  description = "Instance type used to run Kubernetes worker"
  default     = "t3.large"
}

variable "worker_count" {
  type        = number
  description = "Number of workers nodes to deploy"
  default     = 3
}

variable "lb_instance_type" {
  type        = string
  description = "Instance type used to run Kubernetes control-plane"
  default     = "t3.micro"
}

variable "lb_count" {
  type        = number
  description = "Number of lb nodes to deploy"
  default     = 1
}


variable "volume_size_gb" {
  type        = number
  description = "Size of the volumes to attach to the VMs"
  default     = 30
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Tags for the resources"
}

locals {
  # https://cloud-images.ubuntu.com/locator/ec2/
  # filter: 22.04 LTS eu- ebs-ssd amd64
  ubuntu_amis = {
    "eu-west-1" : "ami-01dd271720c1ba44f"
    "eu-west-2" : "ami-0eb260c4d5475b901"
    "eu-central-1" : "ami-04e601abe3e1a910f"
    "eu-west-3" : "ami-05b5a865c3579bbc4"
    "eu-north-1" : "ami-0989fb15ce71ba39e"
    "eu-south-1" : "ami-0c7f4b046aa261c2d"
  }
}

variable "public_key" {
  type        = string
  description = "The ssh public key the user wants to use to access the instance"
}


variable "dns_zone" {
  type        = string
  description = "The DNS zone where all records will be created"
}
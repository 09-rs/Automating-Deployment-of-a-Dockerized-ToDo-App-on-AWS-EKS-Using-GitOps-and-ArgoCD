variable "aws_region" {
  description = "AWS region for the ToDo GitOps platform"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project identifier used for resource naming and tags"
  type        = string
  default     = "todo-gitops"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
variable "cluster_endpoint_public_access_cidr" {
  description = "Your public IPv4 address in CIDR notation, e.g. 203.0.113.10/32"
  type        = string
}
variable "vpc_cidr" {
  description = "value of the VPC CIDR block"
    type        = string
    default     = "10.0.0.0/16"
}
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "ahmed-feedback-app-eks"
  
}

 
variable "availability_zone" {
  description = "The availability zone to use for the subnets"
  type        = list(string)
}
variable "public_subnet_cidrs" {
    description = "The CIDR block for the public subnets"
    type        = list(string)
}
variable "private_subnet_cidrs" {
    description = "The CIDR block for the private subnets"
    type        = list(string)
}

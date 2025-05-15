variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
    default     = "ahmed-eks- module"
}
variable "cluster_version" {
    description = "The version of the EKS cluster"
    type        = string
    default     = "1.30"
  
}
variable "vpc_id" {
    description = "The ID of the VPC to use for the EKS cluster"
    type        = string
    default     = ""
  
}
variable "subnet_ids" {
    description = "The IDs of the subnets to use for the EKS cluster"
    type        = list(string)
    default     = []
}
variable "node_groups" {
    description = "The node groups to create for the EKS cluster"
    type        = map(object({
        scaling_config = object({
            desired_size = number
            max_size     = number
            min_size     = number
        })
        
    }))
  
}
# ☁️ Terraform AWS EKS + VPC Modules

This repository contains two reusable, production-ready Terraform modules to deploy:
- 🛰️ A secure, multi-AZ **Virtual Private Cloud (VPC)**
- ☸️ A scalable **Amazon EKS (Elastic Kubernetes Service) Cluster**

Built for modular deployment on AWS with focus on automation, tagging, scalability, and GitOps compatibility.

---

## 📁 Module Structure

```
.
├── eks-module/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── vpc-module/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
└── README.md
```

---

## 🚀 Prerequisites

- Terraform v1.0+
- AWS CLI configured
- IAM permissions for EKS, VPC, EC2, IAM

---

## 🔧 VPC Module Features

- Create VPC with DNS support
- Public/private subnets across AZs
- Internet Gateway and NAT Gateway setup
- Public & private route tables with associations
- EKS-compatible tagging

### ✅ VPC Input Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `vpc_cidr` | CIDR block for the VPC | `string` | `"10.0.0.0/16"` |
| `cluster_name` | Used in tags | `string` | `"ahmed-feedback-app-eks"` |
| `availability_zone` | AZs list | `list(string)` | n/a |
| `public_subnet_cidrs` | Public subnet CIDRs | `list(string)` | n/a |
| `private_subnet_cidrs` | Private subnet CIDRs | `list(string)` | n/a |

### 📤 VPC Outputs

- `vpc_id`, `vpc_cidr`
- `public_subnet_ids`, `private_subnet_ids`
- `internet_gateway_id`, `nat_gateway_ids`
- `route_table_ids`, `route_table_association_ids`

---

## ☸️ EKS Module Features

- EKS control plane with custom version
- Managed node groups
- Configurable node scaling
- Subnet-based deployment
- IAM roles (hardcoded for sandbox use)

### ✅ EKS Input Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `cluster_name` | EKS cluster name | `string` | `"ahmed-eks-module"` |
| `cluster_version` | K8s version | `string` | `"1.30"` |
| `vpc_id` | VPC ID to deploy into | `string` | `""` |
| `subnet_ids` | Subnet IDs for EKS | `list(string)` | `[]` |
| `node_groups` | Node group config | `map(object)` | _required_ |

### 📤 EKS Outputs

- `cluster_name`, `cluster_version`
- `subnet_ids`, `node_groups`

---

## 🛠 Example Usage

```hcl
module "vpc" {
  source              = "./vpc-module"
  vpc_cidr            = "10.0.0.0/16"
  cluster_name        = "ahmed-feedback-app-eks"
  availability_zone   = ["us-east-1a", "us-east-1b"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs= ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks" {
  source          = "./eks-module"
  cluster_name    = "ahmed-cluster"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids

  node_groups = {
    default = {
      scaling_config = {
        desired_size = 2
        max_size     = 3
        min_size     = 1
      }
    }
  }
}
```

---

## ⚠️ IAM Role Note

This module uses hardcoded IAM roles due to sandbox limitations:

```hcl
role_arn = "arn:aws:iam::877773779009:role/LabRole"
```

In production, replace this with dynamic IAM role creation using `aws_iam_role` and policy attachment blocks.

---

## 👨‍💻 Maintainer

**Ahmed Osama Taha**  
📧 ahmed.osama.taha2@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/ahmedosamataha)  
💻 [GitHub](https://github.com/Ahmed-Osama-Taha)

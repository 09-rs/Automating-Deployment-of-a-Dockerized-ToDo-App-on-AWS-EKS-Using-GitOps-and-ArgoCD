
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.project_name}-cluster"
  kubernetes_version = "1.37"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  endpoint_public_access = true

  endpoint_public_access_cidrs = [var.cluster_endpoint_public_access_cidr]

  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = { before_compute = true }
  }

  eks_managed_node_groups = {
    default = {
      name           = "${var.project_name}-nodes"
      instance_types = ["t3.medium"]
      subnet_ids     = module.vpc.public_subnets

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

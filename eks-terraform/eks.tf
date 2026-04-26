module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name                    = local.name
  kubernetes_version      = "1.35"
  endpoint_public_access  = true
  endpoint_private_access = true

  # Networking
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  enable_cluster_creator_admin_permissions = true

  # EKS Add-ons (latest versions auto-resolved)
  addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true # Deploy before node groups to avoid networking issues
    }
    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true # Enables pod-level IAM via Pod Identity
    }
  }


  # Managed Node Groups
  eks_managed_node_groups = {
    trendapp_ng = {

      instance_types = [var.instance_type]

      desired_size  = var.desired_size
      min_size      = var.min_size
      max_size      = var.max_size
      capacity_type = "SPOT"
      tags = {
        ExtraTag = "trend-eks-node-group"
      }
    }
  }

  access_entries = {
    admin = {
      principal_arn = "arn:aws:iam::706257132842:user/Ajay"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  tags = {
    Project = local.name
  }
}
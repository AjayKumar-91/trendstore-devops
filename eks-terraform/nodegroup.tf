resource "aws_eks_node_group" "nodegroup" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "trend-nodes"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = module.vpc.private_subnets

  instance_types = ["t3.medium"]
  disk_size      = 30

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  labels = {
    role = "general"
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_eks_cluster.eks]
}
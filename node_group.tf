resource "aws_eks_node_group" "eks_node_group" {
    
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = format("%s-node-group", local.name)
  node_role_arn   = aws_iam_role.eks_node_role.arn
  
  launch_template { 
    name    = aws_launch_template.node.name
    version = 1
  }  

  #disk_size       = var.disk_size
  #instance_types  = var.instance_types

  subnet_ids = [
    aws_subnet.eks_subnet_private_1a.id, 
    aws_subnet.eks_subnet_private_1b.id
  ]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly
  ]

  tags = {
    Name = format("%s-node-group", local.name)
  }

}
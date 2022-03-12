resource "aws_eks_cluster" "eks_cluster" {

  name     = local.name
  role_arn = aws_iam_role.eks_master_role.arn
  version  = var.kubernetes_version
  
  vpc_config {

      subnet_ids = [
        aws_subnet.eks_subnet_private_1a.id, 
        aws_subnet.eks_subnet_private_1b.id
      ]
      
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_cluster,
    aws_iam_role_policy_attachment.eks_cluster_service
  ]

}
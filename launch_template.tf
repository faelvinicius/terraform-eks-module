resource "aws_launch_template" "node" {

  name_prefix = join("-", ["lt", local.name])

  ebs_optimized        = var.ebs_optimized
  image_id             = var.ami_id
  
  default_version      = "latest_version"

  iam_instance_profile {
    name = aws_iam_instance_profile.eks_node.name
  }

  instance_type        = var.instance_types

  vpc_security_group_ids = [ aws_security_group.node_group_sg.id ]

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_security_group.node_group_sg,
    aws_iam_instance_profile.eks_node,
  ]

  tags = {
    Name = format("%s-node-group", local.name)  
  }
}
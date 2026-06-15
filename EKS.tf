resource "aws_eks_cluster" "eks-cluster" {
   name = "nec-eks-cluster"
   role_arn = aws_iam_role.cluster_iam_role.arn
   version = "1.34" 
   
    vpc_config {
      subnet_ids = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id, aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]
          endpoint_private_access = true
          endpoint_public_access  = true
    } 

    depends_on = [aws_iam_role.cluster_iam_role, aws_iam_role_policy_attachment.cluster_iam_role1]
}

resource "aws_eks_node_group" "eks-node-group" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  node_group_name = "nec-eks-node-group"
  node_role_arn = aws_iam_role.node_iam_role.arn
  subnet_ids = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]
  scaling_config {
    desired_size = 3
    max_size = 8
    min_size = 2
    }
#    launch_template {
#    id = aws_launch_template.nec-launchtemplate-1.id
#    version = "$Latest"
    
 # }
  depends_on = [ aws_iam_role_policy_attachment.nodepolicy, aws_iam_role_policy_attachment.cnipolicy, aws_iam_role_policy_attachment.ecrpolicy]
}

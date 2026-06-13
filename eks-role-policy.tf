resource "aws_iam_role" "cluster_iam_role" {
    name = "eks-cluster-role"
    assume_role_policy = jsonencode({
        
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
    })
}

resource "aws_iam_role_policy_attachment" "cluster_iam_role1" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.cluster_iam_role.name
}

resource "aws_iam_role" "node_iam_role" {
    name = "eks-node-role"
    assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "nodepolicy" {
    role = aws_iam_role.node_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}

resource "aws_iam_role_policy_attachment" "cnipolicy" {
        role = aws_iam_role.node_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}

resource "aws_iam_role_policy_attachment" "ecrpolicy" {
        role = aws_iam_role.node_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}
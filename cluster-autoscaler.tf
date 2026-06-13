resource "aws_iam_role" "cluster-autoscaler-role" {
    name = "cluster-autoscaler-role"
    assume_role_policy = jsonencode(
        {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::311414082845:oidc-provider/oidc.eks.ap-northeast-1.amazonaws.com/id/68E050EC4E31A3F06567FAC2264FF8C8"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.ap-northeast-1.amazonaws.com/id/68E050EC4E31A3F06567FAC2264FF8C8:sub": "system:serviceaccount:kube-system:cluster-autoscaler",
                    "oidc.eks.ap-northeast-1.amazonaws.com/id/68E050EC4E31A3F06567FAC2264FF8C8:aud": "sts.amazonaws.com"
                }
            }
        }
    ]
}
    )
}


resource "aws_iam_policy" "cluster-autoscaler-policy" {
    name = "cluster-autoscaler-policy"
    policy = jsonencode(
       {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeScalingActivities",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeLaunchTemplateVersions",
                "eks:DescribeNodegroup"  
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
    )
}

resource "aws_iam_role_policy_attachment" "cluster-autoscaler-attach" {
    role = aws_iam_role.cluster-autoscaler-role.name
    policy_arn = aws_iam_policy.cluster-autoscaler-policy.arn
}
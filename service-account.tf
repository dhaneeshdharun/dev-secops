resource "aws_iam_role" "cluster-service-account-role1" {
  name = "app-serviceaccount-role"
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
          "oidc.eks.ap-northeast-1.amazonaws.com/id/68E050EC4E31A3F06567FAC2264FF8C8:sub": "system:serviceaccount:production:app-serviceaccount"
        }
      }
    }
  ]
}
  )
  
}

resource "aws_iam_role" "cluster-service-account-role2" {
  name = "fluentbit-serviceaccount-role"
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
          "oidc.eks.ap-northeast-1.amazonaws.com/id/68E050EC4E31A3F06567FAC2264FF8C8:sub": "system:serviceaccount:fluentbit:fluentbit-serviceaccount"
        }
      }
    }
  ]
}
  )
  
}

resource "aws_iam_role_policy_attachment" "fluentbit_cloudwatch_attach" {
  role       = aws_iam_role.cluster-service-account-role2.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}
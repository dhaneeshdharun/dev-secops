resource "aws_launch_template" "nec-launchtemplate-1" {
    name_prefix = "nec-launchtemplate"
    image_id = "ami-018d98dc304bc192c"
    instance_type = "t3.medium"

    user_data = base64encode(<<-EOF
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: application/node.eks.aws

---
apiVersion: node.eks.aws/v1alpha1
kind: NodeConfig
spec:
  cluster:
    apiServerEndpoint: https://811DFDCEE8C9D63C60AE385DE87CA349.gr7.ap-northeast-1.eks.amazonaws.com
    certificateAuthority: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJRU5vWHJ4SE1rc3d3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TmpBMk1UTXdOakV4TlRWYUZ3MHpOakEyTVRBd05qRTJOVFZhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURSb0pDNTJ4ZHVST0JGYmJoak5sNEREQnI1QzFTeXRZUUJhYThXaEw5Z0ZmMGltSWpPZlpNWVBiOG8KVEI3L0ZQbEwvRys2N0FBR3NrdlJBNGdNVE5saXV5RWZZemRkZ1lEVHc4blNIRjVNYks2SkUyZkNWVC9wektSKwpFdTdmZHZ0bm55RHlaTnE3TGZTYUN3Y21GS0lHVkhhaDV2ZXpsMzFVN2FmdjJ3MDR0TWE4eUtSdnFmVmVjUTU1CkZJSkdvVnUrQW1Lc0FCdytmTmtaazg2SDJTVFc5TXc0cjl4dnZvK3d6cFFNQmR6SmEyOThtYkI0RS9ZNzlMRTkKeU9TVHBWZE9ONGlhWm1IU0dVeFB5Vm5qU2ZIQW42TXBwOW90ZVRTbGJZenE3eFQ5cDlPQzFEYUUyZk13UXZzWApuajhjOXNIaXhnY0F3bnBENjQ1SzExSmhZYmhIQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJRRkdzUFA1TnZFdHZYZmlJTXE2eE9LRzVxdVh6QVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRREZaMTAzcHVpcAovcTdFdG40SlR5dXBGVmY5aVdFKzR4YUhoRVMrZnNpVmhSTkl0bDRqTkE0ck5lNGFBYmt3dWFzcHduVXJsZFdCCmdHVVZGdkdEdHU5ZldnMythWTNURXBjb1ROR0c4STdxWEdFNk5uSU1BT24vSTFKazRMQVRGUkRPK29kbWN3UzkKWFI2bmdkQk96OTA5SGk5WmNlOHBSKysxNFl4bGE0bEhGbXh2dGZMNjM2MG9rM0V5bi83QTF5c3lEbmpKYXMyVQplZWlQQVY3cXA4R0EvSFdyUjc2MS9yNVlpUmc3OUo3N1AweStQbWhuZ1ZINmNWendZV1BQbStEbzdVU3VvZGhuCllRZytybFhBUW42Y2dteXVGcS9IZXVQdi9BMGxEbEtqN0ZrOGJlWGcwSXhTbEc4RHBIaFBFVmNzb0N6NVRQM0YKRktOTEhGUEdVWVA2Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    cidr: 172.20.0.0/16
    name: nec-eks-cluster
  kubelet:
    config:
      maxPods: 15
      clusterDNS:
      - 172.20.0.10
    flags:
    - "--node-labels=eks.amazonaws.com/nodegroup-image=ami-018d98dc304bc192c,eks.amazonaws.com/capacityType=ON_DEMAND,eks.amazonaws.com/nodegroup=nec-eks-node-group"

--//--
prebootstrapCommands:
  - echo " hello dhaneesh"
EOF
  )
}
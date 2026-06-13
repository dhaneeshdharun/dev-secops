resource "aws_ecr_repository" "ecr-repository" {
  name = "nec-ecr-repository"
  tags = {
    Name = "nec-ecr-repository"
  }
}
provider "aws" {
    region = "us-east-1"
 }

resource "aws_iam_policy" "policy" {
  name        = "secret_manager_ro"
  path        = "/"
  description = "RO access to a specific secrets in secret manager"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
         "secretsmanager:GetResourcePolicy",
         "secretsmanager:GetSecretValue",
         "secretsmanager:DescribeSecret",
         "secretsmanager:ListSecretVersionIds"
      ],
      "Effect": "Allow",
      "Resource": "${var.secret_arn}"
    }
  ]
}
EOF
}

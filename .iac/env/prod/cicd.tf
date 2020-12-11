# reference ci/cd user
data "aws_iam_user" "cicd" {
  user_name = "srv_${var.app}_cicd"
}

# grant required permissions to deploy to environment
data "aws_iam_policy_document" "cicd_policy" {
  # allows user to run ecs task using task execution and app roles
  statement {
    sid = "s3"

    actions = [
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.site.arn,
      "${aws_s3_bucket.site.arn}/*"
    ]
  }
}

resource "aws_iam_user_policy" "cicd_user_policy" {
  name   = "${local.product}-cicd"
  user   = data.aws_iam_user.cicd.user_name
  policy = data.aws_iam_policy_document.cicd_policy.json
}

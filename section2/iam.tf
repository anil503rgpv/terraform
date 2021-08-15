resource "aws_iam_user" "lb" {
  name = var.iam_elb_name[count.index]
  count = length(var.iam_elb_name)
  path = "/system/"
  tags = local.common_tags
}
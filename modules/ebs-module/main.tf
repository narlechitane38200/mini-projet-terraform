resource "aws_ebs_volume" "myebs" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  tags   = var.aws_common_tags
}

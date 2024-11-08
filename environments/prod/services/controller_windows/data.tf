# EC2 IAM instance profile (has been created by IAM template)
data "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_main_instance_profile"
}

data "template_file" "user_data" {
  template = file("user_data.txt")

  vars = {
    directoryId   = "d-123"
    directoryName = "steblynskyi.prod"
    directoryOU   = "OU=${var.OU},OU=Servers - AWS,OU=steblynskyi,DC=steblynskyi,DC=prod"
  }
}
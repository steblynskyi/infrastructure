# ============================= Start: EC2 Role/Policy ======================================
# An IAM role is similar to a user, in that it is an AWS identity with permission policies that determine what the identity can and cannot do in AWS
resource "aws_iam_role" "ec2_main_role" {
  name               = "ec2_main_role"
  assume_role_policy = file("assume-role-policy-ec2.json")
}

# An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when the instance starts.
# IAM role to an instance, you choose the role based on a list of instance profile names.
# An instance profile can contain only one IAM role.
resource "aws_iam_instance_profile" "ec2_main_instance_profile" {
  name = "ec2_main_instance_profile"
  role = aws_iam_role.ec2_main_role.name
}

# The policy will BE attached to ec2 role to have access to s3 to do deployment via codedeploy
resource "aws_iam_policy" "ec2_custom_policy" {
  name   = "ec2_custom_policy"
  policy = file("s3-role-policy-codedeploy.json")
}

# Attach SSM policy to role
resource "aws_iam_role_policy_attachment" "ec2_role_ssm" {
  role       = aws_iam_role.ec2_main_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# Attach custom policy to role
resource "aws_iam_role_policy_attachment" "ec2_role_codedeploy" {
  role       = aws_iam_role.ec2_main_role.name
  policy_arn = aws_iam_policy.ec2_custom_policy.arn
}

# ============================= END: EC2 Role/Policy ======================================

# ============================= Start: CodeDeploy Role/Policy ======================================
resource "aws_iam_role" "codeDeploy_service" {
  name               = "CodeDeploy_Service"
  assume_role_policy = file("assume-codedeploy-role-policy.json")
}

resource "aws_iam_role_policy_attachment" "codedeploy_attach_policy" {
  role       = aws_iam_role.codeDeploy_service.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

# ============================= END: CodeDeploy Role/Policy ======================================

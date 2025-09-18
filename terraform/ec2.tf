resource "aws_instance" "flask_ec2" {
  ami           = "ami-08982f1c5bf93d976" 
  instance_type = "t2.micro"
  key_name      = "demokey"  
  depends_on = [ aws_ecr_repository.flask_app ]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  }
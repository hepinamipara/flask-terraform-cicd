output "ec2_public_ip" {
  value = aws_instance.flask_ec2.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.flask_app.repository_url
}

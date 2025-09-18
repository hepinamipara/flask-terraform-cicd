Flask App CI/CD with Terraform, EC2 & ECR

This project demonstrates a simple CI/CD pipeline using GitHub Actions, Terraform, Amazon ECR, and EC2.

🚀 Workflow

Terraform provisions:

EC2 instance

ECR repository

IAM roles

GitHub Actions:

Builds and pushes a Docker image of the Flask app to ECR

SSH into EC2 and deploys the latest image

App runs on EC2 at port 5000.

🔧 Setup

Create IAM user for GitHub with:

AmazonEC2FullAccess

AmazonEC2ContainerRegistryFullAccess

Add secrets in GitHub:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

EC2_SSH_KEY (private key .pem)

Update Terraform provider.tf with region (us-east-1).

▶️ Usage

Push code to main → GitHub Actions:

Runs terraform apply

Builds & pushes Docker image

Deploys on EC2



📂 Project Structure
flask-terraform-cicd/
  ├── app.py
  ├── Dockerfile
  ├── requirements.txt
  └── terraform/
       ├── ec2.tf
       ├── ecr.tf
       ├── iam-role.tf
       ├── provider.tf
       └── output.tf


👉 Super lightweight: just push code and your app auto-deploys!
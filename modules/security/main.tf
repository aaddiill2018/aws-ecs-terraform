# Security Group for allowing inbound HTTP/HTTPS traffic
resource "aws_security_group" "ajalah_prod_sg" {
  name        = "ajalah-prod-sg"
  description = "Allow HTTP and HTTPS inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ajalah-prod-sg"
  }
}

# IAM Role for ECS with policies
resource "aws_iam_role" "ajalah_prod_ecs_role" {
  name               = "ajalah-prod-ecs-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json

  tags = {
    Name = "ajalah-prod-ecs-role"
  }
}

# IAM Role Policy Attachment for ECS
resource "aws_iam_role_policy_attachment" "ecs_policy_attachment" {
  role       = aws_iam_role.ajalah_prod_ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

# KMS Key for encrypting data
resource "aws_kms_key" "ajalah_prod_kms" {
  description             = "KMS key for encrypting sensitive data"
  deletion_window_in_days = 7

  tags = {
    Name = "ajalah-prod-kms-key"
  }
}

# Secrets Manager for storing secrets
resource "aws_secretsmanager_secret" "ajalah_prod_db_password" {
  name = "ajalah-prod-db-password"
}

resource "aws_secretsmanager_secret_version" "ajalah_prod_db_password_version" {
  secret_id     = aws_secretsmanager_secret.ajalah_prod_db_password.id
  secret_string = jsonencode({
    password = var.db_password
  })
}




# resource "aws_security_group" "elb_sg" {
#   name        = "elb-security-group"
#   description = "Security group for ELB"
#   vpc_id      = var.vpc_id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# output "security_group_id" {
#   value = aws_security_group.elb_sg.id
# }

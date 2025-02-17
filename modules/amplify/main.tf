resource "aws_amplify_app" "ajalah_app" {
  name       = var.app_name
  repository = var.repository_url
  platform   = "WEB"

  enable_auto_branch_creation  = true
  enable_basic_auth            = false
  iam_service_role_arn         = var.iam_role_arn

  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  environment_variables = {
    ENV = "production"
  }

  tags = {
    Name = "ajalah-prod-amplify-app"
  }
}

resource "aws_amplify_branch" "ajalah_main_branch" {
  app_id      = aws_amplify_app.ajalah_app.id
  branch_name = "main"
  framework   = "React"
  stage       = "PRODUCTION"
}

resource "aws_amplify_domain_association" "ajalah_domain" {
  app_id      = aws_amplify_app.ajalah_app.id
  domain_name = var.domain_name

  sub_domain {
    branch_name = aws_amplify_branch.ajalah_main_branch.branch_name
    prefix      = ""
  }
}

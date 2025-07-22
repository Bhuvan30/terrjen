pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-credentials').username
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials').password
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Bhuvan30/terrjen.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        failure {
            echo 'Terraform deployment failed!'
        }
        success {
            echo 'Terraform deployment succeeded!'
        }
    }
}

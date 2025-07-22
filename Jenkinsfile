environment {
    AWS_DEFAULT_REGION = 'eu-east-1'
    // Use the 'withCredentials' Jenkins pipeline step to inject creds
}

stages {
    stage('Terraform Init') {
        steps {
            withCredentials([usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh '''
                    terraform init
                '''
            }
        }
    }
    stage('Terraform Plan') {
        steps {
            withCredentials([usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh '''
                    terraform plan -out=tfplan
                '''
            }
        }
    }
    stage('Terraform Apply') {
        steps {
            input 'Approve apply?'
            withCredentials([usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh '''
                    terraform apply -auto-approve tfplan
                '''
            }
        }
    }
}

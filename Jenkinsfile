pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCOUNT_ID = '347228921057'
        ECR_REGISTRY = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
    }

    stages {

        stage('Build') {
            steps {
                sh 'docker build -t devops-backend:${BUILD_NUMBER} ./backend'
                sh 'docker build -t devops-frontend:${BUILD_NUMBER} ./frontend'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run --rm devops-backend:${BUILD_NUMBER} node --version'
            }
        }

        stage('ECR Login') {
            steps {
                sh '''
                    aws ecr get-login-password --region ${AWS_REGION} |
                    docker login --username AWS --password-stdin ${ECR_REGISTRY}
                '''
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                    docker tag devops-backend:${BUILD_NUMBER} \
                    ${ECR_REGISTRY}/devops-backend:${BUILD_NUMBER}

                    docker tag devops-frontend:${BUILD_NUMBER} \
                    ${ECR_REGISTRY}/devops-frontend:${BUILD_NUMBER}

                    docker push ${ECR_REGISTRY}/devops-backend:${BUILD_NUMBER}
                    docker push ${ECR_REGISTRY}/devops-frontend:${BUILD_NUMBER}
                '''
            }
        }
    }
}
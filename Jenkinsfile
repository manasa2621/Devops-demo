pipeline {
    agent any

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

        stage('Deploy') {
            steps {
                sh '''
                cd /home/ubuntu/Devops-demo
                docker-compose pull
                docker-compose up -d --build
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'docker-compose ps'
                sh 'curl -f http://localhost:5000/health'
            }
        }
    }
}
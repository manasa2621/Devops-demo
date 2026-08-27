pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Backend') {
            steps {
                sh 'docker build -t devops-backend:${BUILD_NUMBER} ./backend'
            }
        }

        stage('Build Frontend') {
            steps {
                sh 'docker build -t devops-frontend:${BUILD_NUMBER} ./frontend'
            }
        }

        stage('Test Backend') {
            steps {
                sh 'docker run --rm devops-backend:${BUILD_NUMBER} node --version'
            }
        }

        stage('Show Images') {
            steps {
                sh 'docker images'
            }
        }
    }
}
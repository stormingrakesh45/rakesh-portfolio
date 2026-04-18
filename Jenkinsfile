pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Pulling latest code from GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t rakeshportfolio:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Deploying container...'
                sh 'docker stop rakeshportfolio || true'
                sh 'docker rm rakeshportfolio || true'
                sh 'docker run -d --name rakeshportfolio -p 8081:80 rakeshportfolio:latest'
                echo 'Site is live at http://localhost:8081'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline finished! Site updated successfully.'
        }
        failure {
            echo '❌ Pipeline failed. Check logs above.'
        }
    }
}
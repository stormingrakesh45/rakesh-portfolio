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
                bat 'docker build -t rakeshportfolio:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Deploying container...'
                // Stop old container if running, ignore error if not
                bat 'docker stop rakeshportfolio || echo "No container to stop"'
                bat 'docker rm rakeshportfolio || echo "No container to remove"'
                // Run fresh container
                bat 'docker run -d --name rakeshportfolio -p 8080:80 rakeshportfolio:latest'
                echo 'Site is live at http://localhost:8080'
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
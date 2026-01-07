
pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/mubeen-hub78/devops-real-production.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t prod-app:latest .'
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                docker rm -f prod-app || true
                docker run -d \
                  --name prod-app \
                  -p 8080:80 \
                  prod-app:latest
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                sleep 5
                curl -f http://localhost:8080 || exit 1
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment successful'
        }
        failure {
            echo 'Deployment failed - check Jenkins logs'
        }
    }
}

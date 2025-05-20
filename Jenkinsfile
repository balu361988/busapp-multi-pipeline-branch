pipeline {
    agent any

    environment {
        IMAGE_NAME = "balu361988/busapp"
        VERSION = "prod"
        DOCKERHUB_CREDENTIALS = "dockerhub-creds" // Jenkins credential ID
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                sh './docker-build.sh'
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}:${VERSION}
                    '''
                }
            }
        }

        stage('Deploy Env') {
            steps {
                sh './docker-deploy.sh'
            }
        }
    }

    post {
        failure {
            echo "Deployment failed"
        }
        success {
            echo "Deployment succeeded"
        }
    }
}


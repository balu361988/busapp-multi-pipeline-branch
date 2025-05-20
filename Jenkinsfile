pipeline {
    agent any

    environment {
        IMAGE_NAME = "balu361988/busapp"
        VERSION = "prod"
        DOCKERHUB_CREDENTIALS = "dockerhub-creds"
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
                withDockerRegistry([credentialsId: "${DOCKERHUB_CREDENTIALS}", url: 'https://index.docker.io/v1/']) {
                    sh '''
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


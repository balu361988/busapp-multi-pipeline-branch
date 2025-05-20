pipeline {
  agent any

  environment {
    DOCKER_HUB_USER = "balu361988"
    IMAGE_NAME = "busapp"
    IMAGE_TAG = "prod"
    FULL_IMAGE_NAME = "${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
  }

  stages {
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${FULL_IMAGE_NAME}", "--no-cache .")
        }
      }
    }

    stage('Push Docker Image to DockerHub') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
            dockerImage.push()
          }
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        script {
          sh '''
            version=prod
            env="prod"
            if docker ps -a --format '{{.Names}}' | grep "${env}"; then
              docker stop ${env} && docker rm ${env}
            fi
            docker run -it -d -p 9000:8001 --name ${env} ${FULL_IMAGE_NAME}
          '''
        }
      }
    }
  }

  post {
    success {
      echo "Deployment successful"
    }
    failure {
      echo "Deployment failed"
    }
  }
}

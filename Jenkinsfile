pipeline {
  agent any

  environment {
    DOCKER_HUB_USER = "balu361988"         // ✅ Your Docker Hub username
    IMAGE_NAME = "busapp"                  // ✅ Your repository name on Docker Hub
    IMAGE_TAG = "prod"                     // ✅ Or use: "v${BUILD_NUMBER}" if dynamic
    FULL_IMAGE_NAME = "${DOCKER_HUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
  }

  stages {
    ...
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
    ...
  }
}

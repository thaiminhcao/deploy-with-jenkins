pipeline {
    agent {
        dockerfile true
    }

    environment {
        DOCKER_IMAGE = 'thaihihi/demo:latest'
        DOCKER_REGISTRY_URL = 'https://index.docker.io/v1/'
        DOCKER_REGISTRY_CREDENTIALS_ID = 'docker-hub'
    }

    stages {
        
        stage('Push Docker image to registry') {
            steps {
                docker.withRegistry('${DOCKER_REGISTRY_URL}','${DOCKER_REGISTRY_CREDENTIALS_ID}' ) {
                    def customImage = docker.build('${DOCKER_IMAGE}')
                    customImage.push()
                }
            }
        }

        stage('Pull Docker image from registry') {
            steps {
                docker.withRegistry('${DOCKER_REGISTRY_URL}','${DOCKER_REGISTRY_CREDENTIALS_ID}' ) {
                    docker.pull('${DOCKER_IMAGE}')
                }
            }
        }

        stage('Run Docker image') {
            steps {
                docker.image('${DOCKER_IMAGE}').withRun('-d -p 3000:3000')
            }
        }
    }
}

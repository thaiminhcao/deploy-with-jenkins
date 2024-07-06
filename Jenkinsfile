pipeline {
    agent {
        dockerfile true
    }

    environment {
        DOCKER_IMAGE = 'thaihihi/demo:latest'
        DOCKER_REGISTRY_URL = 'https://index.docker.io/v1/'
        DOCKER_REGISTRY_CREDENTIALS_ID = 'docker-hub'
        DOCKER_TAG ="${GIT_BRANCH.tokenize('/).pop()}-${BUILD_NUMBER}-${GIT_COMMIT.substring(0,7)}"
    }

    stages {
        stage('Push Docker image to registry') {
            steps {
                script {
                    docker.withRegistry('${DOCKER_REGISTRY_URL}', '${DOCKER_REGISTRY_CREDENTIALS_ID}') {
                        sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                        sh 'docker push ${DOCKER_IMAGE}:latest'
                    }
                }
            }
        }

        stage('Pull Docker image from registry') {
            steps {
                script {
                    docker.withRegistry('${DOCKER_REGISTRY_URL}', '${DOCKER_REGISTRY_CREDENTIALS_ID}') {
                        docker.image('${DOCKER_IMAGE}').pull()
                    }
                }
            }
        }

        stage('Run Docker image') {
            steps {
                script {
                    docker.image('${DOCKER_IMAGE}').withRun('-d -p 3000:3000') {
                        echo 'Docker container is running'
                    }
                }
            }
        }
    }
}

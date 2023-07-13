pipeline {
    agent any{
        kubernetes {
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Mohitgupta1301/notejam.git' // Replace with your repository URL
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t frontend .' 
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push mohit1301/frontend' 
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml' 
            }
        }
    }
}

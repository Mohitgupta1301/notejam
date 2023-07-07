pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages
  stage('Checkout') {
    node {
        checkout scm
        stash 'https://github.com/Mohitgupta1301/notejam.git'
    }
  stage('Build') {
      steps {
        sh 'docker build -t mohit1301/jenkins-docker-hub2 .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push mohit1301/jenkins-docker-hub2'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

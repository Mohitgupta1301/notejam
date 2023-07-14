pipeline {

 

  environment {

    dockerimagename = "mohit1301/frontend"
   registeryCredential = 'dockerhub'

    dockerImage = ""

  }

 

  agent any

 

  stages {

 

    stage('Checkout Source') {

      steps {

        git branch: 'master', url: 'https://github.com/Mohitgupta1301/notejam.git'

      }

    }

 

    stage('Build image') {

      steps{

        script {

          dockerImage = docker.build dockerimagename + ":$BUILD_NUMBER"

        }

      }

    }

 

    stage('Pushing Image') {


      steps{

        script {

          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {

            dockerImage.push("latest")

          }

        }

      }

    }

 

    stage('Deploying App to Kubernetes') {

      steps {

        script {

          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")

        }

      }

    }

 

  }
  }

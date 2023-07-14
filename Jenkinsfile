pipeline {

 

  environment {

    dockerimagename = "mohit1301/frontend"

    dockerImage = ""

  }

 

  agent any

 

  stages {

 

    stage('Checkout Source') {

      steps {

        git 'https://github.com/Mohitgupta1301/notejam.git'

      }

    }

 

    stage('Build image') {

      steps{

        script {

          dockerImage = docker.build frontend

        }

      }

    }

 

    stage('Pushing Image') {

      environment {

               registryCredential = 'dockerhublogin'

           }

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

pipeline {

  environment {

    imagename = "mohit1301/frontend"

    dockerImage = ""

    registryCredential = 'dockerhub_id'

    KUBECONFIG = credentials('config_id')

  }

  agent any 
  
  stages {

    stage('Cloning Repo') {

      steps {

        git branch:'master',url: 'https://github.com/Mohitgupta1301/notejam.git'

      }

    }

    stage('Building Image') {

      steps{

        script {

          dockerImage = docker.build imagename

        }

      }

    }

    stage('Pushing Image') {

      steps{

        script {

          docker.withRegistry( '', registryCredential ) {

            dockerImage.push("latest")

          }

        }

      }

    }

    stage('Deploying the Application to the K8 Cluster') {

      steps {

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /opt/jenkins/workspace/jenkins-notejam/notejam-service.yaml'

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /opt/jenkins/workspace/jenkins-notejam/persistentvolume.yaml'

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /opt/jenkins/workspace/jenkins-notejam/notejam-service.yaml'

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /opt/jenkins/workspace/jenkins-notejam/notejam-deploy.yaml'



    }

  }

}

}  

pipeline {

  environment {

    imagename = "mohit1301/frontend"

    dockerImage = ""

    registryCredential = 'dockerhub_id'

    KUBECONFIG = credentials('config_data')

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
          sh 'systemctl start docker'
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

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins_home/workspace/jenkins-notejam/notejam-service.yaml'

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins_home/workspace/jenkins-notejam/persistentvolume.yaml'

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins_home/workspace/jenkins-notejam/notejam-service.yaml'

        sh 'sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins_home/jenkins-notejam/notejam-deploy.yaml'



    }

  }

}

}  

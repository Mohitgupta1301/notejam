pipeline {
  environment {
    imagename = "mohit1301/frontend"
    dockerImage = ""
    registryCredential = 'dockerhub'
    KUBECONFIG = credentials('config_data')
  }
  agent any 
  stages {
    stage('Cloning Repo') {
      steps {
        git branch:'master',url: 'https://github.com/Mohitgupta1301/notejam.git'
      }
    }
    stage('Building our image') {
      steps {
        script {
          dockerImage = sh "docker build -t ${imagename}:$BUILD_NUMBER ."
        }
      }
    }
    stage('Pushing Image') {
      steps {
        script {
          // Login to Docker Hub
          //sh "docker login -u <your-docker-hub-username> -p <your-docker-hub-password>"
          
          // Push the image to Docker Hub
          sh "sudo docker push ${imagename}:latest"
        }
      }
    }
    stage('Deploying the Application to the K8 Cluster') {
      steps {
        sh "sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins/workspace/jenkins-kubernetes/service-deployment.yaml"
        sh "sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins/workspace/jenkins-kubernetes/persistentvolumeclaim.yaml"
        sh "sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins/workspace/jenkins-kubernetes/notejam-service.yaml"
        sh "sudo kubectl --kubeconfig=${KUBECONFIG} apply -f /var/lib/jenkins/workspace/jenkins-kubernetes/notejam-deploy.yaml"
      }
    }
  }
}

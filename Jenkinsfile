pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // Checkout the source code from version control
        git 'https://github.com/your/repo.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        // Build the Docker image
        script {
          sh 'docker build -t your-image-name .'
        }
      }
    }

    stage('Transfer Docker Image') {
      steps {
        // Transfer the Docker image to the second EC2 instance
        script {
          // Copy the Docker image to the second EC2 instance using SCP
          sh 'scp -i /path/to/private/key.pem your-image-name ec2-user@your-second-instance-ip:/path/on/remote/host'
        }
      }
    }

    stage('Deploy on Second EC2 Instance') {
      steps {
        // Deploy the Docker image on the second EC2 instance via SSH
        script {
          // Connect to the second EC2 instance via SSH and run Docker commands
          sshagent(['your-ssh-credentials-id']) {
            sh 'ssh -o StrictHostKeyChecking=no -i /path/to/private/key.pem ec2-user@your-second-instance-ip "docker stop your-container-name"'
            sh 'ssh -o StrictHostKeyChecking=no -i /path/to/private/key.pem ec2-user@your-second-instance-ip "docker rm your-container-name"'
            sh 'ssh -o StrictHostKeyChecking=no -i /path/to/private/key.pem ec2-user@your-second-instance-ip "docker run -d --name your-container-name -p 80:80 your-image-name"'
          }
        }
      }
    }
  }
}

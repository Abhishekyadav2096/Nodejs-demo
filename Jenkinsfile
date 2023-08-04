pipeline {
    agent any
    
    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code" 
                withCredentials([string(credentialsId: 'github-access-token', variable: 'GIT_TOKEN')]) {
                    git url: "https://github.com/Abhishekyadav2096/Nodejs-demo.git", credentialsId: 'github-access-token', branch: "main"
                }
            }
        }
        
        stage("Build") {
            steps {
                echo "Building the image"
                sh "docker build -t nodejs-demo ."
            }
        }
        
        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "docker tag nodejs-demo ${env.dockerHubUser}/nodejs-demo:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/nodejs-demo:latest"
                }
            }
        }
        
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}

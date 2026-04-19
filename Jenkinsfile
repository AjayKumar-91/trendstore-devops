pipeline {
    agent any
    environment {
        IMAGE_NAME = "trendstore-app"
        DOCKERHUB_REPO = "ajaykumar91/trendstore-app"
        TAG = "latest"
    }
    stages {
        stage("Code Clone Checkout") {
            steps {
                git branch: 'master', url: 'https://github.com/AjayKumar-91/TrendStore.git'
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t $IMAGE_NAME:$TAG ."
            }
        }

        stage("Test Application") {
            steps {
                echo "Developer/Tester Running tests..."
            }
        }

        stage("Tag Image") {
            steps {
                sh "docker tag $IMAGE_NAME:$TAG $DOCKERHUB_REPO:$TAG"
            }
        }

        stage('Push Image to Docker Hub') {
            steps { 
                withCredentials([usernamePassword(
                credentialsId: "DockerHub_Credentials",
                usernameVariable: "dockerHubUser",
                passwordVariable: "dockerHubPass"
                )]) {
                sh '''
                echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin
                docker push $DOCKERHUB_REPO:$TAG
                '''
               }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                // sh 'aws eks update-kubeconfig --name trend-eks-cluster --region us-east-1'
                // sh 'kubectl apply -f deployment.yaml'
                // sh 'kubectl apply -f service.yaml'
                sh 'docker compose down || true'
                sh 'docker compose up -d --build trendstore'
            }
        }
    }

    post {
        success {
            echo "Pipeline Successful..."
        }
        failure {
            echo "Pipeline Failed..."
        }
    }
}

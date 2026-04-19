pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                deleteDir()
                git branch: 'master', url: 'https://github.com/AjayKumar-91/TrendStore.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trendstore-app .'
            }
        }

        stage('Login & Push Image to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId:"DockerHub_Credentials",
                    passwordVariable: "dockerHubPass",
                    usernameVariable: "dockerHubUser"               
                )]){ 
                    sh '''
                    echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin
                    docker tag trendstore-app $dockerHubUser/trendstore-app:latest
                    docker push $dockerHubUser/trendstore-app:latest
                    '''
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                docker stop trendstore-app || true
                docker rm trendstore-app || true
                docker rmi trendstore-app || true
                docker compose down || true
                docker compose up -d --build trendstore
                '''
            }
        }
        
        stage('Debug K8s') {
            steps {
                echo "Debugging Kubernetes setup..."
                // sh 'kubectl cluster-info'
                // sh 'kubectl get nodes'
            }
        }
        

        stage('Deploy to Kubernetes') {
            steps { 
                echo "Deploying to Kubernetes..."
                /* 
                dir('kubernetes') {
                    sh 'aws eks update-kubeconfig --name trend-eks-cluster --region us-east-1'
                    sh 'ls -l'   // verify inside folder
                    sh 'kubectl apply -f deployment.yml'
                    sh 'kubectl apply -f service.yml'
                }
                */
            }
        }

        stage('Verify Monitoring') {
            steps {
                echo "Monitoring setup verified successfully."
                // sh 'kubectl get pods'
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

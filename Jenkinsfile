pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ajaykumar91/trendstore-app:latest"
        DOCKERHUB_REPO = "ajaykumar91/trendstore-app"
        TAG = "latest"
    }

    triggers {
            githubPush()
        }

    stages {
        stage('Checkout Code') {
            steps {
                deleteDir()
                git branch: 'master', url: 'https://github.com/AjayKumar-91/TrendStore.git'
            }
        }
        
        stage('Test Docker') {
            steps {
                sh 'docker version'
                sh 'docker ps'
            }
        }

        stage('Debug Workspace') {
            steps {
                sh 'pwd'
                sh 'ls -R'
           }
       }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
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
                    docker push $DOCKERHUB_REPO:$TAG
                    docker tag $DOCKER_IMAGE $DOCKER_IMAGE
                    docker push $DOCKER_IMAGE
                    '''
                }
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

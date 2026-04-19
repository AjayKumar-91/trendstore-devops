pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ajaykumar91/trendstore-app:latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
<<<<<<< HEAD
=======
                deleteDir()
>>>>>>> ee54f22 (fix: docker and nginx deployment working)
                git branch: 'master', url: 'https://github.com/AjayKumar-91/TrendStore.git'
            }
        }
        
        triggers {
            githubPush()
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

        stage('Push Image to Docker Hub') {
            steps {
                sh '''
<<<<<<< HEAD
                echo $dockerHubPass | docker login -u $dockerHubUser --password-stdin
                docker push $DOCKERHUB_REPO:$TAG
=======
                docker tag $DOCKER_IMAGE $DOCKER_IMAGE
                docker push $DOCKER_IMAGE
>>>>>>> ee54f22 (fix: docker and nginx deployment working)
                '''
            }
        }
        
        stage('Debug K8s') {
            steps {
                sh 'kubectl cluster-info'
                sh 'kubectl get nodes'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
<<<<<<< HEAD
                // sh 'aws eks update-kubeconfig --name trend-eks-cluster --region us-east-1'
                // sh 'kubectl apply -f deployment.yaml'
                // sh 'kubectl apply -f service.yaml'
                sh 'docker compose down || true'
                sh 'docker compose up -d --build trendstore'
=======
                dir('kubernetes') {
                    sh 'ls -l'   // verify inside folder
                    sh 'kubectl apply -f deployment.yml'
                    sh 'kubectl apply -f service.yml'
                }
            }
        }
        stage('Verify Monitoring') {
            steps {
                sh 'kubectl get pods'
>>>>>>> ee54f22 (fix: docker and nginx deployment working)
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

pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        DOCKER_IMAGE = "ajaykumar91/trendstore-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
        AWS_REGION = "us-east-1"
        CLUSTER_NAME = "trend-eks-cluster"
    }

    stages {

        stage('Checkout Code') {
            steps {
                deleteDir()
                git branch: 'master', url: 'https://github.com/AjayKumar-91/trendstore-devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$IMAGE_TAG .'
            }
        }

        stage('Login & Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "DockerHub_Credentials",
                    usernameVariable: "DOCKER_USER",
                    passwordVariable: "DOCKER_PASS"
                )]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push $DOCKER_IMAGE:$IMAGE_TAG
                        docker tag $DOCKER_IMAGE:$IMAGE_TAG $DOCKER_IMAGE:$IMAGE_TAG
                        docker push $DOCKER_IMAGE:$IMAGE_TAG
                    '''
                }
            }
        }

        stage('Update Kubeconfig') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    sh '''
                        aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
                        kubectl get nodes
                    '''
                } 
            }
        }  

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    set -e
                    sed -i "s|IMAGE_TAG|$IMAGE_TAG|g" kubernetes/deployment.yaml
                    kubectl apply -f kubernetes/deployment.yaml
                    kubectl apply -f kubernetes/service.yaml
                '''
            }
        }

        stage('Verify Kubernetes Deployment') {
            steps {
                sh 'kubectl rollout status deployment/trendstore-deployment'
                sh 'kubectl get pods -o wide'
                sh 'kubectl get svc'
            }
        }

        stage('Check Monitoring Health') {
            steps {
                sh '''
                    echo "Checking Prometheus targets..."
                    curl -s http://prometheus.monitoring.svc.cluster.local:9090/-/ready || true
                '''
            }
        }

        stage('Cleanup') {
            steps {
                sh 'docker rmi $DOCKER_IMAGE:$IMAGE_TAG || true'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

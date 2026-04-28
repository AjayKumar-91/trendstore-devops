pipeline {
    agent any

    options {
        disableConcurrentBuilds()     // 🔥 prevent parallel conflicts
        quietPeriod(10)               // 🔥 avoid duplicate webhook triggers
    }

    triggers {
        githubPush()
    }

    environment {
        DOCKER_IMAGE = "ajaykumar91/trendstore-app"
        IMAGE_TAG = "${BUILD_NUMBER}-${GIT_COMMIT.take(7)}"   // 🔥 unique tag
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
                sh '''
                    set -e
                    docker build -t $DOCKER_IMAGE:$IMAGE_TAG .
                '''
            }
        }

        stage('Push to DockerHub') {
            steps {
                retry(2) {   // 🔥 retry for network issues
                    withCredentials([usernamePassword(
                        credentialsId: "DockerHub_Credentials",
                        usernameVariable: "DOCKER_USER",
                        passwordVariable: "DOCKER_PASS"
                    )]) {
                        sh '''
                            set -e
                            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                            docker push $DOCKER_IMAGE:$IMAGE_TAG
                        '''
                    }
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                retry(2) {   // 🔥 retry for kubectl/aws transient issues
                    sh '''
                        set -ex

                        echo "=== AWS Identity ==="
                        aws sts get-caller-identity

                        echo "=== Configure kubeconfig ==="
                        aws eks update-kubeconfig \
                          --region $AWS_REGION \
                          --name $CLUSTER_NAME

                        echo "=== Verify cluster access ==="
                        kubectl get nodes

                        echo "=== Update image tag ==="
                        sed -i "s|IMAGE_TAG|${IMAGE_TAG}|g" kubernetes/deployment.yaml

                        echo "=== Deploy ==="
                        kubectl apply -f kubernetes/deployment.yaml
                        kubectl apply -f kubernetes/service.yaml
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    set -e
                    kubectl rollout status deployment/trendstore-deployment --timeout=120s
                    kubectl get pods -o wide
                    kubectl get svc
                '''
            }
        }

        stage('Monitoring Check') {
            steps {
                sh '''
                    echo "Checking Prometheus..."
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
            echo 'Pipeline failed! Check logs above 👆'
        }
    }
}
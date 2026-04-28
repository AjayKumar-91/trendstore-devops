# local run application
npm install -g serve
serve -s . -l 3000

# Docker Setup Build Image
docker build -t trendstore-app .

# Rebuild clean
docker build --no-cache -t trendstore-app .

# Dockerfile run containers
docker run -d -p 5000:80 trendstore-app
docker run -d --name trend-app -p 5000:80 trendstore-app

# inside container
docker run -it trendstore-app sh
ls /usr/share/nginx/html

docker compose down -v
docker compose up -d

docker system prune -a -f
docker volume prune -f

docker ps
docker ps -a
docker images
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker system prune -a
docker ps
docker ps -a
docker images


# terraform
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
terraform destroy -auto-approve && terraform apply -auto-approve

# Recreate EC2 with correct key
terraform taint aws_instance.jenkins
terraform apply

cp jenkins-key-auto ~/
cd ~
chmod 400 jenkins-key-auto
ssh -i ~/jenkins-key-auto ubuntu@13.220.63.209

chmod 400 jenkins-key-auto
ssh -i jenkins-key-auto ubuntu@<NEW-IP>
ssh -i ~/.ssh/jenkins-key-auto ubuntu@44.204.246.154
ssh -i ~/jenkins-key-auto ubuntu@44.202.250.56
ssh -i jenkins-key-auto ubuntu@ec2-34-201-9-64.compute-1.amazonaws.com

# Kubernetes on AWS EKS — Start to End Guide

1. Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install
aws --version

2. Install kubectl (Kubernetes CLI)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

3. Install eksctl (EKS Tool)
curl --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz
sudo mv eksctl /usr/local/bin/
eksctl version

4. Configure AWS
AWS Access Key ID [None]: AKIAxxxxxxxx
AWS Secret Access Key [None]: xxxxxxxxx
Default region name [None]: us-east-1
Default output format [None]: json

5. Final Check (Must Pass)
aws sts get-caller-identity
kubectl version --client
eksctl version

# Create EKS Cluster
eksctl create cluster --name trend-eks-cluster --region us-east-1 --nodegroup-name trend-worker-nodes \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed

eksctl create cluster --name trend-eks-cluster --region us-east-1 --node-type m7i-flex.large 

eksctl delete cluster --name clustername --region regioncode

eksctl delete cluster --name trend-eks-cluster --region us-east-1


## Safe run (no SSH):
eksctl create cluster \
--name trend-eks-cluster \
--region us-east-1 \
--nodegroup-name trend-worker-nodes \
--node-type m7i-flex.large \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed \
--ssh-access=false


eksctl create cluster \
--name trend-eks-cluster \
--region us-east-1 \
--nodegroup-name trend-worker-nodes \
--node-type m7i.large \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed \
--zones us-east-1a,us-east-1b

### Verify Cluster is Running
eksctl get cluster --region us-east-1
aws eks list-clusters

## Check cluster list
aws eks list-clusters --region us-east-1

# Connect kubectl to Cluster/Update kubeconfig
aws eks update-kubeconfig --region us-east-1 --name trend-eks-cluster

# Verify Cluster is Running
1. Check Nodes
kubectl get nodes

2. Check System Pods
kubectl get pods -A

3. Check Cluster Info
kubectl cluster-info

4. Check cluster services
kubectl get svc

# Deploy apps
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml

# Delete node groups
aws eks delete-nodegroup --cluster-name trend-eks-cluster --nodegroup-name trend-worker-nodes --region us-east-1

# delete only the EKS cluster
aws eks delete-cluster --name trend-eks-cluster --region us-east-1

# Delete Entire EKS Cluster
eksctl delete cluster --name trend-eks-cluster --region us-east-1

Step 1: Check if Node Group Exists
aws eks list-nodegroups --cluster-name trend-eks-cluster --region us-east-1

Step 2: Check Node Group Details
aws eks describe-nodegroup --cluster-name trend-eks-cluster --nodegroup-name trend-nodes --region us-east-1

Step 3: Verify Deletion
aws eks list-nodegroups --cluster-name trend-eks-cluster --region us-east-1

# You can watch status:
watch aws eks list-nodegroups --cluster-name trend-eks-cluster --region us-east-1


# Delete Entire Cluster
aws eks delete-cluster --name trend-eks-cluster --region us-east-1
aws eks delete-cluster --name trend-eks-cluster --region us-east-1

# Verify deletion
aws eks list-clusters --region us-east-1

# How to Deploy
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Verify Deployment
kubectl get pods
kubectl get deployments
kubectl get svc


# correct path for Git Bash
ssh -i /d/devops_projects/TrendStore/terraform/jenkins-key-auto ubuntu@3.237.173.35
ls /d/devops_projects/TrendStore/terraform
chmod 400 /d/devops_projects/TrendStore/terraform/jenkins-key-auto
ssh -i /d/devops_projects/TrendStore/terraform/jenkins-key-auto ubuntu@3.237.173.35

# create a Docker Hub repository
docker login
docker build -t trendstore-app .
docker tag trendstore-app ajaykumar91/trendstore-app:latest
docker push ajaykumar91/trendstore-app:latest

# 1. Add HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# 2. Add repo
sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# 3. Update
sudo apt update

# 4. Install Terraform
sudo apt install terraform -y

aws eks --region us-east-1 update-kubeconfig --name trend-eks-cluster

#  Connect to cluster
aws eks update-kubeconfig --region us-east-1 --name trend-eks-cluster
kubectl get nodes

# CLEAN COMMAND BLOCK
sudo apt update -y
sudo apt install -y docker.io

sudo systemctl enable docker
sudo systemctl start docker

sudo groupadd docker || true
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins

sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock

sudo systemctl restart docker
sudo systemctl restart jenkins
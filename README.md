# 🚀 End-to-End DevOps CI/CD Pipeline Project (React + AWS + Kubernetes)

This project demonstrates a **complete production-ready DevOps
pipeline** for deploying a React application using modern tools like
**Docker, Terraform, AWS EKS, Jenkins, GitHub, and Monitoring
(Prometheus + Grafana).**

------------------------------------------------------------------------

# 📌 Project Overview

This project automates the complete software delivery lifecycle:

-   Application Deployment (React)
-   Containerization using Docker
-   Infrastructure Provisioning using Terraform
-   Kubernetes Deployment on AWS EKS
-   CI/CD Automation using Jenkins
-   Monitoring using Prometheus & Grafana
-   Version Control using GitHub

------------------------------------------------------------------------


# 📂 Application Repository

``` bash
git clone https://github.com/Vennilavanguvi/Trend.git
cd Trend
```

------------------------------------------------------------------------


# ▶️ Run Application
``` bash
npm install -g serve
serve -s . -l 3000
```

Application runs on: 
http://localhost:3000
http://44-197-245-218:3000

------------------------------------------------------------------------
🐳 Docker
📌 Objective:

Dockerize the React application for consistent deployment.

🛠 Steps:
Create a Dockerfile
Build Docker image
Run container using Docker
🚀 Commands:
``` bash
docker build -t trend-app .
docker run -p 3000:3000 trend-app
```



# ☁️ Terraform Infrastructure (AWS)

## Resources Created:

-   VPC
-   Subnets
-   Security Groups
-   IAM Roles
-   EC2 Instance (Jenkins Server)
-   AWS EKS Cluster

## Commands:
``` bash
terraform init 
terraform plan 
terraform apply -auto-approve
```




------------------------------------------------------------------------



🐳 DockerHub
📌 Steps:
Create DockerHub repository
Push Docker image
🚀 Commands:
``` bash
docker login
docker tag trend-app ajaykumar91/trend-app
docker push ajaykumar91/trend-app
```

------------------------------------------------------------------------
☸️ Kubernetes (AWS EKS)
📌 Objective:

Deploy application in Kubernetes cluster on AWS EKS.

🧱 Steps:
Setup EKS Cluster
Create Deployment YAML
Create Service YAML (LoadBalancer)
📄 deployment.yaml

## Files:

-   deployment.yaml
-   service.yaml

## Deploy:
```bash
kubectl apply -f deployment.yaml 
kubectl apply -f service.yaml
```
## Verify:
```bash
kubectl get pods 
kubectl get svc
```
## Access:
```bash
af08cb4b645554ec185848ea81a15ec9-348762946.us-east-1.elb.amazonaws.com
```
------------------------------------------------------------------------

🔁 Version Control (GitHub)
📌 Steps:
Push code to GitHub repository
Add .gitignore
Add .dockerignore
🚀 Commands:
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/AjayKumar-91/trendstore-devops.git
git push -u origin main
```


------------------------------------------------------------------------

# 🔁 Jenkins CI/CD Pipeline

GitHub → Jenkins → Build → Docker Image → DockerHub → Kubernetes (EKS)

Features: - GitHub Webhook Trigger - Automated Build - Docker Image
Creation - Push to DockerHub - Deploy to EKS Cluster

⚙️ Jenkins CI/CD
📌 Tools Required:
Jenkins
Docker Plugin
Git Plugin
Kubernetes Plugin
Pipeline Plugin
📌 Setup:
Install Jenkins
Configure GitHub integration
Setup Webhook trigger
🔁 Pipeline Flow:
GitHub → Jenkins → Build → Docker Image → DockerHub → Kubernetes Deploy
📜 Pipeline Features:
Auto build on every commit
Docker image creation
Push to DockerHub
Deploy to AWS EKS

------------------------------------------------------------------------




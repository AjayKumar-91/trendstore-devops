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
https://github.com/Vennilavanguvi/Trend.git
```

------------------------------------------------------------------------

# ▶️ Run Application Locally

npm install npm start

Application runs on: http://localhost:3000

------------------------------------------------------------------------

# 🐳 Docker Setup

## Build & Run Container

docker build -t trend-app . docker run -p 3000:3000 trend-app

## Push to DockerHub

docker login docker tag trend-app
`<dockerhub-username>`{=html}/trend-app docker push
`<dockerhub-username>`{=html}/trend-app

------------------------------------------------------------------------

# ☁️ Terraform Infrastructure (AWS)

## Resources Created:

-   VPC
-   Subnets
-   Security Groups
-   IAM Roles
-   EC2 Instance (Jenkins Server)
-   AWS EKS Cluster

## Commands:

terraform init terraform plan terraform apply -auto-approve

------------------------------------------------------------------------

# ☸️ Kubernetes Deployment (AWS EKS)

## Files:

-   deployment.yaml
-   service.yaml

## Deploy:

kubectl apply -f deployment.yaml kubectl apply -f service.yaml

## Verify:

kubectl get pods kubectl get svc

## Access:

http://`<LoadBalancer-External-IP>`{=html}:3000

------------------------------------------------------------------------

# 🔁 Jenkins CI/CD Pipeline

GitHub → Jenkins → Build → Docker Image → DockerHub → Kubernetes (EKS)

Features: - GitHub Webhook Trigger - Automated Build - Docker Image
Creation - Push to DockerHub - Deploy to EKS Cluster

------------------------------------------------------------------------

# 📂 Git Version Control

git init git add . git commit -m "Initial commit" git branch -M main git
remote add origin `<repo-url>`{=html} git push -u origin main

Includes: - .gitignore - .dockerignore

------------------------------------------------------------------------

# 📊 Monitoring (Prometheus + Grafana)

Tools: - Prometheus - Grafana - kube-state-metrics

Metrics: - Pod Health - CPU & Memory Usage - Node Performance -
Application Availability

------------------------------------------------------------------------

# 🏗️ Architecture Flow

Developer → GitHub → Jenkins → Docker → DockerHub → EKS → LoadBalancer →
Monitoring

------------------------------------------------------------------------

# 📦 Deliverables

-   GitHub Repo
-   Terraform Code
-   Kubernetes YAMLs
-   Jenkins Pipeline
-   Dockerfile
-   Monitoring Setup

------------------------------------------------------------------------

# 🌐 Final Output

-   React App on Kubernetes
-   AWS LoadBalancer URL
-   Fully Automated CI/CD Pipeline
-   Monitoring Dashboard

------------------------------------------------------------------------

# 🎯 Key Highlights

✔ End-to-End DevOps Pipeline\
✔ AWS Cloud Deployment\
✔ Kubernetes (EKS)\
✔ CI/CD Automation\
✔ Terraform IaC\
✔ Monitoring System

------------------------------------------------------------------------

# 👨‍💻 Author

DevOps Engineering Project

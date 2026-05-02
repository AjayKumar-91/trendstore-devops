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
<img width="1919" height="1019" alt="Screenshot 2026-04-24 150505" src="https://github.com/user-attachments/assets/fc2ae556-c01e-42c2-b8d4-784d4835f149" />

------------------------------------------------------------------------


# ▶️ Run Application
``` bash
npm install -g serve
serve -s . -l 3000
```

Application runs on: 
http://localhost:3000
<img width="1919" height="1015" alt="Screenshot 2026-04-24 150535" src="https://github.com/user-attachments/assets/605a06c6-e596-44da-800f-9700976c00a8" />


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
<img width="1919" height="1028" alt="Screenshot 2026-04-24 153331" src="https://github.com/user-attachments/assets/6227617a-652a-42e9-8a53-c025ee8498af" />

<img width="1919" height="1019" alt="Screenshot 2026-04-24 153355" src="https://github.com/user-attachments/assets/f151a312-4abc-4d3a-8e6e-3ce9231d8862" />

<img width="1919" height="975" alt="Screenshot 2026-04-24 153416" src="https://github.com/user-attachments/assets/7d6b4c00-15c7-4ae3-aed1-49db1497a428" />

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
<img width="1919" height="1021" alt="Screenshot 2026-04-24 161238" src="https://github.com/user-attachments/assets/92008978-77c3-4256-9c2a-f58b0a2b1497" />

<img width="1919" height="1023" alt="Screenshot 2026-04-24 161406" src="https://github.com/user-attachments/assets/dfd48479-4560-4168-9fdc-8362efabdaac" />

<img width="1919" height="978" alt="Screenshot 2026-04-24 161436" src="https://github.com/user-attachments/assets/47515e7f-4685-419f-a9e7-3279721ce992" />

<img width="1919" height="1017" alt="Screenshot 2026-04-24 162644" src="https://github.com/user-attachments/assets/022fd7da-915a-4cfd-8505-aed486d1cb9d" />


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
<img width="1919" height="431" alt="Screenshot 2026-04-24 163358" src="https://github.com/user-attachments/assets/d489fc78-faf2-464c-af9e-5e61657b1e26" />

<img width="1919" height="970" alt="Screenshot 2026-04-24 171251" src="https://github.com/user-attachments/assets/f976e338-f11f-4f2b-9af6-3881be55cc31" />

<img width="1909" height="1017" alt="Screenshot 2026-04-24 172415" src="https://github.com/user-attachments/assets/3fb35ce0-538f-4909-a015-c52274f4083d" />

<img width="1919" height="729" alt="Screenshot 2026-04-24 172455" src="https://github.com/user-attachments/assets/21d5f653-d412-464e-85e5-fbf7d88a7acf" />

<img width="1919" height="491" alt="Screenshot 2026-04-24 172625" src="https://github.com/user-attachments/assets/a836c37e-41c8-432f-bf50-8b9011312d1b" />

<img width="1919" height="1023" alt="Screenshot 2026-04-24 172653" src="https://github.com/user-attachments/assets/58eaadd1-591b-4104-96cc-f85007777e88" />

------------------------------------------------------------------------
☸️ Kubernetes (AWS EKS)
📌 Objective:

Deploy application in Kubernetes cluster on AWS EKS.

🧱 Steps:
Setup EKS Cluster
```bash
eksctl create cluster --name trend-eks-cluster --region us-east-1 --node-type m7i-flex.large
```
<img width="1919" height="798" alt="Screenshot 2026-04-28 173552" src="https://github.com/user-attachments/assets/2dd02844-cc72-4d2a-8828-bee9d2caee7a" />


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

<img width="1919" height="971" alt="Screenshot 2026-04-26 205756" src="https://github.com/user-attachments/assets/31418d66-ac05-4336-b233-786e6bda367b" />
<img width="1919" height="968" alt="Screenshot 2026-04-26 205830" src="https://github.com/user-attachments/assets/9bf5d33f-9b0f-43d6-bef1-074c00434964" />
<img width="1919" height="967" alt="Screenshot 2026-04-26 210829" src="https://github.com/user-attachments/assets/cbe8e252-c8b0-431d-90c7-112fcd4d02d3" />
<img width="1327" height="215" alt="Screenshot 2026-04-26 223055" src="https://github.com/user-attachments/assets/993d28a8-21f1-4b4a-a825-23a0e862b66b" />
<img width="1919" height="1023" alt="Screenshot 2026-04-26 233218" src="https://github.com/user-attachments/assets/2caa281f-1afd-42e0-aa14-012062ce92bb" />
<img width="1919" height="976" alt="Screenshot 2026-04-26 234132" src="https://github.com/user-attachments/assets/7f3b885e-575b-4003-a8ae-86f1b50750a9" />

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
<img width="1919" height="1020" alt="Screenshot 2026-04-27 170503" src="https://github.com/user-attachments/assets/c2233f31-bf0b-42d0-a22d-2a822ef9970b" />


------------------------------------------------------------------------

# 🔁 Jenkins CI/CD Pipeline

GitHub → Jenkins → Build → Docker Image → DockerHub → Kubernetes (EKS)

Features: - GitHub Webhook Trigger - Automated Build - Docker Image

Creation - Push to DockerHub - Deploy to EKS Cluster

# ⚙️ Jenkins CI/CD
## 📌 Tools Required:

Jenkins

Docker Plugin

Git Plugin

Kubernetes Plugin

Pipeline Plugin

## 📌 Setup:

Install Jenkins

Configure GitHub integration

Setup Webhook trigger

## 🔁 Pipeline Flow:

GitHub → Jenkins → Build → Docker Image → DockerHub → Kubernetes Deploy

## 📜 Pipeline Features:

Auto build on every commit

Docker image creation

Push to DockerHub

Deploy to AWS EKS

------------------------------------------------------------------------

# 📊 Monitoring (Open Source)
## 📌 Tools:

Prometheus

Grafana

## 📌 Purpose:

Monitor cluster health

Monitor application performance

Visual dashboards

## 📈 Metrics:

CPU Usage

Memory Usage

Pod Health

Node Status


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
# 🐳 Docker

## 📌 Objective:

Dockerize the React application for consistent deployment.

## 🛠 Steps:

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



# 🐳 DockerHub
## 📌 Steps:

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
-   
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
<img width="1919" height="987" alt="Screenshot 2026-04-28 173635" src="https://github.com/user-attachments/assets/d176dc68-c91d-4598-ac44-7abe2b2ab99b" />

<img width="1327" height="215" alt="Screenshot 2026-04-26 223055" src="https://github.com/user-attachments/assets/993d28a8-21f1-4b4a-a825-23a0e862b66b" />
<img width="1919" height="1023" alt="Screenshot 2026-04-26 233218" src="https://github.com/user-attachments/assets/2caa281f-1afd-42e0-aa14-012062ce92bb" />
<img width="1919" height="976" alt="Screenshot 2026-04-26 234132" src="https://github.com/user-attachments/assets/7f3b885e-575b-4003-a8ae-86f1b50750a9" />

------------------------------------------------------------------------

# 🔁 Version Control (GitHub)

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

<img width="1919" height="970" alt="Screenshot 2026-04-24 161055" src="https://github.com/user-attachments/assets/281bd47d-c000-479b-a0ce-c575965d8bc7" />
<img width="1916" height="1017" alt="Screenshot 2026-04-24 162912" src="https://github.com/user-attachments/assets/97b2e3d6-e0b3-4f4d-8918-a608f31194c4" />
<img width="1919" height="971" alt="Screenshot 2026-04-24 162941" src="https://github.com/user-attachments/assets/6cd5f86d-625d-4fd5-9022-d5625afc16d1" />
<img width="1919" height="961" alt="Screenshot 2026-04-24 163007" src="https://github.com/user-attachments/assets/7e84259d-fb4c-41af-b92e-3823270df40a" />
<img width="1919" height="965" alt="Screenshot 2026-04-24 163044" src="https://github.com/user-attachments/assets/ef0ca4b4-06d3-4770-a7d2-28268c040b84" />
<img width="1919" height="969" alt="Screenshot 2026-04-24 163146" src="https://github.com/user-attachments/assets/f37d99fe-a8df-4fe9-b724-37becc72970a" />

<img width="1919" height="974" alt="Screenshot 2026-04-26 211136" src="https://github.com/user-attachments/assets/bdf1e3b4-f010-44ec-8747-96523763e9ca" />
<img width="1919" height="976" alt="Screenshot 2026-04-26 211222" src="https://github.com/user-attachments/assets/dc6a03a1-5801-470c-95e0-4a2240326c7e" />
<img width="1913" height="964" alt="Screenshot 2026-04-26 211600" src="https://github.com/user-attachments/assets/62dd7816-d8bf-427f-9da0-ccd5438dff76" />
<img width="1913" height="970" alt="Screenshot 2026-04-26 211803" src="https://github.com/user-attachments/assets/5ae765d1-08c7-4423-a213-7a0fadf540aa" />
<img width="1919" height="974" alt="Screenshot 2026-04-26 211859" src="https://github.com/user-attachments/assets/2d2b78ae-6805-46e1-9858-3c9b67a83879" />
<img width="1919" height="550" alt="Screenshot 2026-04-26 212457" src="https://github.com/user-attachments/assets/c5dc18ba-d6a3-4142-98de-7d8a083d0c9f" />
<img width="1919" height="968" alt="Screenshot 2026-04-26 214105" src="https://github.com/user-attachments/assets/a6289fb0-e762-4bbf-852c-4a447183638a" />
<img width="1919" height="979" alt="Screenshot 2026-04-26 214140" src="https://github.com/user-attachments/assets/72c6189b-1dfe-42b0-bd95-8de3665ba145" />
<img width="1919" height="973" alt="Screenshot 2026-04-26 214502" src="https://github.com/user-attachments/assets/e43485da-3ed7-44b6-b3ba-d1af8e28324f" />
<img width="1919" height="966" alt="Screenshot 2026-04-26 214555" src="https://github.com/user-attachments/assets/fd6e0cc4-cb11-40b5-be97-28a2c2d4f9d8" />
<img width="1919" height="968" alt="Screenshot 2026-04-26 214621" src="https://github.com/user-attachments/assets/a8fcb05c-972a-4005-9619-e89cfdbb0abc" />
<img width="1919" height="1021" alt="Screenshot 2026-04-26 214924" src="https://github.com/user-attachments/assets/0ee5f5c2-1382-4218-800d-4e50a3766ff8" />
<img width="1919" height="976" alt="Screenshot 2026-04-27 003057" src="https://github.com/user-attachments/assets/804ff9f8-bcb2-4bfe-9552-b9be6b920561" />
<img width="1919" height="970" alt="Screenshot 2026-04-28 194324" src="https://github.com/user-attachments/assets/ce365a43-4a30-434d-9bdd-3f6d93bc2684" />


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
<img width="1919" height="1009" alt="Screenshot 2026-05-02 133153" src="https://github.com/user-attachments/assets/8fcef6a3-7c9d-48e7-9ebb-79f4d914e506" />
<img width="1919" height="1018" alt="Screenshot 2026-05-02 133231" src="https://github.com/user-attachments/assets/104adac0-b557-4798-bab6-07c0105ce049" />
<img width="1919" height="1030" alt="Screenshot 2026-05-02 134322" src="https://github.com/user-attachments/assets/f0d5e73e-90d7-4672-9ff9-22ff6d15b46c" />
<img width="1919" height="974" alt="Screenshot 2026-05-02 134614" src="https://github.com/user-attachments/assets/6279e605-754c-47d0-ab18-c791a58d777d" />
<img width="1919" height="969" alt="Screenshot 2026-05-02 134906" src="https://github.com/user-attachments/assets/cd476977-dedd-4890-afee-7b6c72e330da" />
<img width="1919" height="963" alt="Screenshot 2026-05-02 134947" src="https://github.com/user-attachments/assets/ec73a864-7755-4c7f-a4c7-313f004b208d" />
<img width="1919" height="973" alt="Screenshot 2026-05-02 135014" src="https://github.com/user-attachments/assets/3a035c03-b803-4cee-8673-4acdded1b6ce" />
<img width="1919" height="966" alt="Screenshot 2026-05-02 135037" src="https://github.com/user-attachments/assets/96024ea8-b012-475f-b268-aee93fd2637b" />
<img width="1912" height="974" alt="Screenshot 2026-05-02 135253" src="https://github.com/user-attachments/assets/a1a0c2e3-8013-479f-bb07-e112311ab3aa" />
<img width="1915" height="965" alt="Screenshot 2026-05-02 141013" src="https://github.com/user-attachments/assets/76a99813-7084-45c7-beb2-03a6bfc4e076" />
<img width="1919" height="179" alt="Screenshot 2026-05-02 141030" src="https://github.com/user-attachments/assets/07f292b1-e6c4-4ef8-a474-cdf03bd602e6" />
<img width="1919" height="347" alt="Screenshot 2026-05-02 143931" src="https://github.com/user-attachments/assets/6a1846e4-2415-443d-9696-08c3ab8f06ba" />
<img width="1919" height="970" alt="Screenshot 2026-05-02 144046" src="https://github.com/user-attachments/assets/d1547153-d823-4f19-b273-3ba53784ad4f" />
<img width="1919" height="967" alt="Screenshot 2026-05-02 144123" src="https://github.com/user-attachments/assets/757257d9-bc01-49cc-88a4-9a32b373d3d3" />
<img width="1919" height="977" alt="Screenshot 2026-05-02 144421" src="https://github.com/user-attachments/assets/472cd6fe-1baa-41d7-bb6d-33a5d6b087d1" />
<img width="1919" height="969" alt="Screenshot 2026-05-02 144626" src="https://github.com/user-attachments/assets/cf4fea00-bee4-4a8a-a8d4-533c03a47b57" />
<img width="1919" height="971" alt="Screenshot 2026-05-02 145623" src="https://github.com/user-attachments/assets/a887a808-c561-486f-9691-69d4de2ffe41" />
<img width="1919" height="977" alt="Screenshot 2026-05-02 150605" src="https://github.com/user-attachments/assets/08884391-2871-4f2a-8d73-5a09fb1ccd70" />
<img width="1918" height="969" alt="Screenshot 2026-05-02 150659" src="https://github.com/user-attachments/assets/68fd7069-e69f-403a-8a00-1b834ee951f4" />
<img width="1919" height="978" alt="Screenshot 2026-05-02 150733" src="https://github.com/user-attachments/assets/9878a034-46c5-4055-8293-8ec8d02a6ac5" />
<img width="1919" height="972" alt="Screenshot 2026-05-02 150809" src="https://github.com/user-attachments/assets/5bbc637c-eebb-48c0-a31f-0d654003cdf4" />


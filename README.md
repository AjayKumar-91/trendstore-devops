# React Application - Dockerized Deployment

This project contains a React application that has been containerized using Docker for easy deployment and scalability.

---

## Project Overview

* React-based frontend application
* Dockerized using multi-stage build
* Served via Nginx in production
* Runs on port **3000**

---

## Prerequisites

Make sure you have the following installed:

* Docker
* Git
* Node.js (optional for local development)

---

## Clone Repository

```bash
git clone https://github.com/Vennilavanguvi/Trend.git
cd Trend
```

---

## Docker Setup

### Create Dockerfile

Create a file named `Dockerfile` in the root directory:

```dockerfile
# Step 1: Build React App
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY ./Trend/dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

---

### 2️⃣ Build Docker Image

```bash
docker build -t trendstore-app .
```

---

### 3️⃣ Run Docker Container

```bash
docker run -d -p 3000:80 --name trendstore-container trendstore-app
```

---

### 4️⃣ Access Application

Open your browser and go to:

```
http://localhost:3000 or AWS ec2 url
```

---

## 📊 Verify Running Container

```bash
docker ps
```

---

## 🛑 Stop & Remove Container

```bash
docker stop trendstore-container
docker rm trendstore-container
```

---

## ❗ Troubleshooting

### 🔹 Port Not Accessible

Check logs:

```bash
docker logs trendstore-container
```

---

### 🔹 Docker Hub Rate Limit Error

Login to Docker:

```bash
docker login
```

---

### 🔹 Container Already Exists

```bash
docker rm -f trendstore-container
```



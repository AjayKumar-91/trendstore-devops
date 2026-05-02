# 🚀 eksctl Full Commands Cheatsheet (DevOps + Portfolio Ready)

This document contains a complete **end-to-end eksctl + EKS workflow** used in real DevOps environments, optimized for GitHub portfolio and interviews.

---

# 🏷️ Badges

![AWS](https://img.shields.io/badge/AWS-EKS-orange)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Cluster-blue)
![eksctl](https://img.shields.io/badge/eksctl-CLI-green)
![DevOps](https://img.shields.io/badge/DevOps-Automation-red)

---

# 🧠 AWS EKS Architecture

```
Developer
   |
   v
eksctl (CLI)
   |
   v
AWS EKS Control Plane (Managed)
   |
   v
Node Group (EC2 Instances)
   |
   v
Pods (Containers)
   |
   v
Service (LoadBalancer)
   |
   v
Users (Internet)
```

---

# 🧱 1. Create EKS Cluster

### Basic cluster

```bash
eksctl create cluster \
--name trend-eks-cluster \
--region us-east-1
```

---

### Production cluster (recommended)

```bash
eksctl create cluster \
--name trend-eks-cluster \
--region us-east-1 \
--nodegroup-name trend-workers \
--node-type m7i-flex.large \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--managed
```

```bash
eksctl create cluster --name trend-eks-cluster --region us-east-1 --node-type m7i-flex.large 

eksctl delete cluster --name clustername --region regioncode

eksctl delete cluster --name trend-eks-cluster --region us-east-1
```

---

# 🔍 2. Get Cluster Details

```bash
eksctl get cluster --region us-east-1
```

---

# 🧑‍💻 3. Get Node Groups

```bash
eksctl get nodegroup --cluster trend-eks-cluster --region us-east-1
```

---

# 🔗 4. Connect kubectl

```bash
aws eks update-kubeconfig --region us-east-1 --name trend-eks-cluster
```

---

# 📦 5. Create Additional Node Group

```bash
eksctl create nodegroup \
--cluster trend-eks-cluster \
--region us-east-1 \
--name extra-nodes \
--node-type m7i-flex.large \
--nodes 2 \
--managed
```

---

# 🚀 6. Deploy Application

### Deployment

```bash
kubectl create deployment nginx-app --image=nginx
```

### Expose Service

```bash
kubectl expose deployment nginx-app \
--type=LoadBalancer \
--port=80
```

### Check Service

```bash
kubectl get svc
```

---

# 📊 7. Scale Application

```bash
kubectl scale deployment nginx-app --replicas=3
```

---

# 🔎 8. Debug Commands

```bash
kubectl get pods
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

---

# 🧹 9. DELETE COMMANDS (COST CONTROL)

## Delete Node Group

```bash
eksctl delete nodegroup \
--cluster trend-eks-cluster \
--name trend-workers \
--region us-east-1
```

---

## Delete Entire Cluster (BEST PRACTICE)

```bash
eksctl delete cluster \
--name trend-eks-cluster \
--region us-east-1
```

---

# 📋 10. IAM Identity Mapping

```bash
eksctl get iamidentitymapping \
--cluster trend-eks-cluster \
--region us-east-1
```

---

# 🔐 11. Add IAM User

```bash
eksctl create iamidentitymapping \
--cluster trend-eks-cluster \
--region us-east-1 \
--arn arn:aws:iam::<account-id>:user/<user-name> \
--group system:masters \
--username admin-user
```

---

# ⚙️ 12. Upgrade Cluster

```bash
eksctl upgrade cluster \
--name trend-eks-cluster \
--region us-east-1
```

---

# 💡 13. DevOps Best Practices

✔ Always use managed node groups
✔ Always delete cluster after practice to avoid billing
✔ Use eksctl for fast lifecycle management
✔ Use kubectl only for application management

---

# Deploy manually (test before Jenkins)
---
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get pods
kubectl get svc
```
---

# 📌 Summary Table

| Task              | Command                   |
| ----------------- | ------------------------- |
| Create cluster    | eksctl create cluster     |
| Add nodes         | eksctl create nodegroup   |
| View cluster      | eksctl get cluster        |
| Connect kubectl   | aws eks update-kubeconfig |
| Deploy app        | kubectl apply / create    |
| Delete everything | eksctl delete cluster     |

---

# 🧠 Interview Answer

> eksctl simplifies AWS EKS management by automating VPC, IAM roles, node groups, and cluster provisioning. It is widely used for quick setup and teardown in DevOps workflows.

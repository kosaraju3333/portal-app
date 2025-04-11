# 🚀 Node.js DevSecOps CI/CD on AWS EKS

This project demonstrates a complete **DevSecOps CI/CD pipeline** for a Node.js application using modern DevOps tools on an **AWS EKS** cluster, featuring GitOps, security scans, and Slack notifications.

---

## 🧰 Stack & Tools

- **Source Code**: GitHub
- **Cluster**: AWS EKS
- **Ingress**: AWS Load Balancer Controller
- **Storage**: AWS EBS CSI Driver
- **GitOps**: Argo CD
- **Security**: Trivy, SonarQube
- **Artifact Repo**: Nexus
- **Container Registry**: Docker Hub
- **Notifications**: Slack
- **Languages**: Node.js 16, Java (for SonarQube)

---

## ⚙️ CI/CD Pipeline Overview

### ✅ CI Pipeline (GitHub Actions)
1. **Checkout code** from GitHub
2. Install dependencies: `Node.js 16`, `Java` (for SonarQube)
3. **Security Scan** using Trivy (Filesystem scan)
4. **Static Code Analysis** via SonarQube with Quality Gates
5. **Build** the Node.js app
6. **Push Artifact** to Nexus
7. **Build Docker Image**
8. **Container Image Scan**
9. **Push Docker Image** to Docker Hub
10. **Trigger GitOps** by updating image tag in GitOps repo
11. **Send Notifications** to Slack with build status

### 🚀 CD Pipeline (Argo CD)
- Argo CD watches the GitOps repo
- On image tag change, it auto-deploys the new version to the EKS cluster

---

## 🛡️ DevSecOps Focus

- ✅ Trivy FS Scan for early vulnerability detection
- ✅ SonarQube for static code analysis with Quality Gate enforcement
- ✅ Image scanning before Docker push
- ✅ GitOps for secure, traceable, declarative deployment

---

## 📦 Application

A sample Node.js web app deployed to an AWS EKS cluster and exposed to the internet using the **AWS Load Balancer Controller**.

---

## 📡 Notifications

Slack integration is configured to notify build status (success/failure) after each pipeline run.

---

## 📁 Repository Structure


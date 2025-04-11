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
Application Overview:
- This is a simple signup system involves users registering on a platform by providing their details, which are then stored in a Postgres database
User Signup Process
  1. User Input: The user fills out a signup form with details such as:
      a. Name
      b. Email
      c. Password
  2. Validation:
      a. Check if required fields are filled.
      b. Validate email format and ensure its unique.
      c. Ensure password meets

  3. Database Entry:
      a. Store the user’s data in the database.
  4. Login & Authentication:
      a. Once verified, users can log in using their credentials.
     
- Deployed a Node.js application and PostgreSQL database on a private AWS EKS cluster, using separate Kubernetes namespaces for logical isolation
- Node.js App Namespace:
    - Configured Deployment, Service, Secrets, ConfigMap, and Horizontal Pod Autoscaler.
    - Applied Liveness & Readiness Probes, along with CPU/memory resource limits for container health and stability.
    - Exposed the app externally via AWS Load Balancer Controller and Ingress with routing rules
- PostgreSQL Namespace:
    - Set up StatefulSet, Service, Secrets, and Liveness Probe for a production-ready DB deployment
    - Installed AWS EBS CSI Driver, and provisioned persistent storage using StorageClass, PersistentVolume, and PersistentVolumeClaim
    - Ensured secure intra-cluster communication between services using private networking and namespace-scoped configurations.

---

## 📡 Notifications

Slack integration is configured to notify build status (success/failure) after each pipeline run.

---

## 📷 Screenshots (Optional)




# portal-app Service
Docker build command with ARGS
* ```ARG variables are temporary, used only during building docker image.```
  
  * `docker image build --build-arg listen_PORT="5000" --build-arg HOST="host_value" --build-arg PORT=5432 --build-arg USER="user_value"
 --build-arg PASSWORD="password_value" --build-arg DATABASE="database_value" -t name_of_image .`

Docker run command with env variables
* ```ENV variables are persistent, we can access the ENV variables inside of the container.```
  
  * `docker run -id -p 3000:3000 -e HOST='host_value' -e PORT='5432' -e USER='user_value' -e PASSWORD='password_value' -e DATABASE='database_value' --name conatainer_name docker_image_name:Version`

Docker run command with --env-file variables
  * `docker run -id -p 3000:3000 --env-file name_of_env_file --name container_name docker_image_name:Version`

Docker command to login to container
  * `docker exec -it container_id /bin/bash`

WRK- a HTTP benchmarcking Tool where we can genarate a load on pods.
 1: Install WRK in pod
  * `apk add wrk`
 2: Now Generate a load to endpoint using below comand
  * `wrk -c 5 -t 5 -d 300s -H "Connection: Close" http://SERVICE_NAME:PORT_NUMBER`


```docker run -id -p 3000:3000 --network portal-app-net -e HOST='postgresdb' -e PORT='5432' -e USER='postgres' -e PASSWORD:'postgres' -e DATABASE:'spontan' -e listen_PORT=3000 --name portal-app kosaraju333/portal-spontan-arg-env_1:V1```
 

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


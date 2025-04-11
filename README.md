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

**Application Overview:**
- This is a simple signup system involves users registering on a platform by providing their details, which are then stored in a Postgres database
  
User Signup Process
  1. User Input: The user fills out a signup form with details such as:
      - Name
      - Email
      - Password
  2. Validation:
      - Check if required fields are filled.
      - Validate email format and ensure its unique.
      - Ensure password meets

  3. Database Entry:
      - Store the user’s data in the database.
  4. Login & Authentication:
      - Once verified, users can log in using their credentials.
     
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

## 📷 Screenshots

- **EKS Cluster**
    ![Screenshot 2025-04-11 at 3 24 12 PM](https://github.com/user-attachments/assets/f88d9701-2378-4887-b653-3e9fe76d457f)
    ![Screenshot 2025-04-11 at 5 09 18 PM](https://github.com/user-attachments/assets/a57da720-5f1a-483a-9aa2-74fd67089958)
    ![Screenshot 2025-04-11 at 5 10 50 PM](https://github.com/user-attachments/assets/285c3d6c-cea8-4e22-bcf7-af128666fdde)

  
- Added AWS_EBS_CSI_Driver
    ![Screenshot 2025-04-11 at 3 22 09 PM](https://github.com/user-attachments/assets/e4365b21-893e-4c6f-8469-3b1b5f241963)

- Installed AWS Load Balancer Controller
    ![Screenshot 2025-04-11 at 3 22 40 PM](https://github.com/user-attachments/assets/29cb3ed5-eeb5-4d5f-9550-4274c617681f)
    ![Screenshot 2025-04-11 at 3 22 59 PM](https://github.com/user-attachments/assets/54ead4a6-f412-4a39-8751-90fda7dc9f32)

- **DevSecOps CI/CD**
  - CI/CD Pipeline
    ![Screenshot 2025-04-11 at 5 05 12 PM](https://github.com/user-attachments/assets/0c494075-8eea-400f-b792-a73770b6db1b)
    ![Screenshot 2025-04-11 at 5 12 49 PM](https://github.com/user-attachments/assets/d4aa5b28-c594-4afc-b546-23e97200a941)


  - SonarQube
    ![Screenshot 2025-04-11 at 3 36 08 PM](https://github.com/user-attachments/assets/ccd31186-9c1c-49f9-a215-523ca9bcd308)
    
  - Nexus
    ![Screenshot 2025-04-11 at 3 36 51 PM](https://github.com/user-attachments/assets/9514f2ab-e459-456c-9560-62316f7d7d29)

  - Docker Hub
    ![Screenshot 2025-04-11 at 5 16 23 PM](https://github.com/user-attachments/assets/8e72c50a-dac2-456e-a522-9b18ad29fd8f)

  - **ArgoCD**
    - Exposed ArgoCD to external world via **Aws Loadbalancer Controller**
    ![Screenshot 2025-04-11 at 3 53 14 PM](https://github.com/user-attachments/assets/d750ed08-938e-4932-abc9-ebde13f9de1c)

    - portal-app-Frontend
    ![Screenshot 2025-04-11 at 3 57 47 PM](https://github.com/user-attachments/assets/554407a3-f428-4ac2-b7f2-4e5195e74170)

    - Portal-database
    ![Screenshot 2025-04-11 at 4 06 32 PM](https://github.com/user-attachments/assets/49af5644-7171-49ee-a198-501c7209c1b7)

  - **Slack Notifications**
    ![Screenshot 2025-04-11 at 5 15 19 PM](https://github.com/user-attachments/assets/ad67984f-c670-484f-bd63-22a32aad8d0f)



  


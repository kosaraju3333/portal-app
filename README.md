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
 

🚀 Node.js DevSecOps CI/CD on AWS EKS
This project demonstrates a complete DevSecOps CI/CD pipeline for a Node.js application using modern DevOps tools on an AWS EKS cluster, featuring GitOps, security scans, and Slack notifications.

🧰 Stack & Tools
Source Code: GitHub
Cluster: AWS EKS
Ingress: AWS Load Balancer Controller
Storage: AWS EBS CSI Driver
GitOps: Argo CD
Security: Trivy, SonarQube
Artifact Repo: Nexus
Container Registry: Docker Hub
Notifications: Slack
Languages: Node.js 16, Java (for SonarQube)
⚙️ CI/CD Pipeline Overview
✅ CI Pipeline (GitHub Actions)
Checkout code from GitHub
Install dependencies: Node.js 16, Java (for SonarQube)
Security Scan using Trivy (Filesystem scan)
Static Code Analysis via SonarQube with Quality Gates
Build the Node.js app
Push Artifact to Nexus
Build Docker Image
Container Image Scan
Push Docker Image to Docker Hub
Trigger GitOps by updating image tag in GitOps repo
Send Notifications to Slack with build status
🚀 CD Pipeline (Argo CD)
Argo CD watches the GitOps repo
On image tag change, it auto-deploys the new version to the EKS cluster
🛡️ DevSecOps Focus
✅ Trivy FS Scan for early vulnerability detection
✅ SonarQube for static code analysis with Quality Gate enforcement
✅ Image scanning before Docker push
✅ GitOps for secure, traceable, declarative deployment
📦 Application
A sample Node.js web app deployed to an AWS EKS cluster and exposed to the internet using the AWS Load Balancer Controller.

Application Overview:

This is a simple signup system involves users registering on a platform by providing their details, which are then stored in a Postgres database
User Signup Process

User Input: The user fills out a signup form with details such as:

Name
Email
Password
Validation:

Check if required fields are filled.
Validate email format and ensure its unique.
Ensure password meets
Database Entry:

Store the user’s data in the database.
Login & Authentication:

Once verified, users can log in using their credentials.
Deployed a Node.js application and PostgreSQL database on a private AWS EKS cluster, using separate Kubernetes namespaces for logical isolation
Node.js App Namespace:
Configured Deployment, Service, Secrets, ConfigMap, and Horizontal Pod Autoscaler.
Applied Liveness & Readiness Probes, along with CPU/memory resource limits for container health and stability.
Exposed the app externally via AWS Load Balancer Controller and Ingress with routing rules
PostgreSQL Namespace:
Set up StatefulSet, Service, Secrets, and Liveness Probe for a production-ready DB deployment
Installed AWS EBS CSI Driver, and provisioned persistent storage using StorageClass, PersistentVolume, and PersistentVolumeClaim
Ensured secure intra-cluster communication between services using private networking and namespace-scoped configurations.
📡 Notifications
Slack integration is configured to notify build status (success/failure) after each pipeline run.

📷 Screenshots
EKS Cluster Screenshot 2025-04-11 at 3 24 12 PM

Added AWS_EBS_CSI_Driver Screenshot 2025-04-11 at 3 22 09 PM

Installed AWS Load Balancer Controller Screenshot 2025-04-11 at 3 22 40 PM Screenshot 2025-04-11 at 3 22 59 PM

DevSecOps CI/CD

SonarQube Screenshot 2025-04-11 at 3 36 08 PM

Nexus Screenshot 2025-04-11 at 3 36 51 PM

ArgoCD

Exposed ArgoCD to external world via Aws Loadbalancer Controller Screenshot 2025-04-11 at 3 53 14 PM

portal-app-Frontend Screenshot 2025-04-11 at 3 57 47 PM

Portal-database Screenshot 2025-04-11 at 4 06 32 PM

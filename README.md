# 🕹️ 2048 Game Deployment on Amazon EKS (Fargate + ALB Ingress)

This project demonstrates deploying a containerized 2048 game application on **Amazon Elastic Kubernetes Service (EKS)** using **AWS Fargate** for serverless compute and the **AWS Load Balancer Controller** to expose the application via an **Application Load Balancer (ALB)**.

 ![IMG_20250525_133136](https://github.com/user-attachments/assets/e3e69921-cf0a-4ff6-b4af-ff660a0aad39)
  

---

## 🚀 Project Overview

This project highlights:

- 📦 **Container orchestration using EKS** (fully managed Kubernetes control plane)
- 🐳 **Serverless compute with AWS Fargate** (no EC2 node management)
- 🌐 **Application exposure using ALB Ingress Controller**
- 🛠️ **Infrastructure provisioning and deployment using CLI tools**
- 🔐 **IAM integration for secure access and controller permissions**

---

## 🧰 Tools & Technologies Used

- **Amazon EKS** – Managed Kubernetes Service
- **AWS Fargate** – Serverless Kubernetes worker nodes
- **AWS ALB Ingress Controller** – To expose the app externally
- **eksctl** – Cluster provisioning and IAM setup
- **kubectl** – Kubernetes resource management
- **AWS CLI** – AWS resource interaction
- **Helm** – Package manager for Kubernetes

---

## 🧩 Key Features

- ✅ Creation of a fully functional EKS cluster with Fargate support
- ✅ Secure IAM integration for ALB Ingress controller using OIDC
- ✅ Deployment of a sample **2048 game** application using YAML manifests
- ✅ Seamless traffic routing to the app via ALB using Ingress
- ✅ Fully CLI-driven deployment workflow

---

## 📌 Prerequisites

Ensure the following tools are installed:

- `aws` CLI (configured with IAM credentials)
- `kubectl`
- `eksctl`
- `helm`

---

## 🧪 Want to Try It?

Clone this repo and follow the instructions in [`commands.sh`](./commands.sh) to replicate the entire setup in your own AWS account.

---

## 🙏 Special Thanks

Huge thanks to **Abhishek Veeramalla** for the amazing (https://youtu.be/RRCrY12VY_s?si=y-JVzv_YiC6N8IFL) that guided this entire setup. Your clear explanations and step-by-step walkthrough made it a breeze!

---

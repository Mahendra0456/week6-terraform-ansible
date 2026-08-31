<div align="center">

# 🚀 Infrastructure as Code — Terraform + Ansible

### Provision. Configure. Deploy. All through code.

![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu%2024.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)

</div>

---

## 📖 Overview

This project demonstrates a complete **Infrastructure as Code (IaC)** and **Configuration Management** workflow on AWS:

> 🏗️ **Terraform** builds the server → ⚙️ **Ansible** configures it → 🌐 **Nginx** serves the app

No manual clicking in the AWS console. No manual SSH-and-configure. Just code, from empty AWS account to a running web server.

---

## 🧩 What Gets Built

| Step | Tool | Action |
|:---:|:---|:---|
| 1️⃣ | **Terraform** | Provisions an EC2 instance + security group on AWS |
| 2️⃣ | **Ansible** | Installs Nginx & curl, creates an app user, sets up `/opt/myapp` |
| 3️⃣ | **Ansible** | Deploys a custom HTML page |
| 4️⃣ | **Ansible** | Starts & enables the Nginx service |
| ✅ | **Result** | A fully configured, publicly reachable web server |

---

## 🔄 Architecture

```
   ┌─────────────┐        ┌──────────────┐        ┌───────────────┐        ┌─────────────┐
   │  Terraform  │ ─────▶ │ EC2 Instance │ ─────▶ │    Ansible     │ ─────▶ │    Nginx    │
   │  (provision)│        │  (created)   │        │  (configure)   │        │ (application)│
   └─────────────┘        └──────────────┘        └───────────────┘        └─────────────┘
```

---

## 🛠️ Tech Stack

- 🟣 **Terraform** — infrastructure provisioning (AWS provider)
- 🔴 **Ansible** — agentless configuration management
- 🟠 **AWS EC2** — compute
- 🟢 **Nginx** — web server
- 🐧 **Ubuntu 24.04 LTS** — instance OS

---

## 📁 Project Structure

```
week6-terraform-ansible/
├── 📂 terraform/
│   ├── main.tf           # EC2 instance + security group
│   ├── variables.tf       # Input variables
│   ├── outputs.tf          # instance_id, public_ip, private_ip
│   ├── terraform.tfvars     # Variable values
│   └── 📂 modules/          # Reusable Terraform module(s)
├── 📂 ansible/
│   ├── inventory.ini       # Target host definition
│   └── playbook.yml         # Server configuration tasks
└── README.md
```

---

## ✅ Prerequisites

- [ ] AWS account with credentials configured (`aws configure`)
- [ ] Terraform installed
- [ ] Ansible installed
- [ ] An AWS key pair for SSH access

---

## ▶️ How to Run

### 1️⃣ Provision the infrastructure
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 2️⃣ Grab the public IP
```bash
terraform output public_ip
```

### 3️⃣ Update the Ansible inventory
Edit `ansible/inventory.ini` with the IP above and your `.pem` key path.

### 4️⃣ Configure the server
```bash
cd ../ansible
ansible -i inventory.ini app -m ping         # 🏓 test connectivity
ansible-playbook -i inventory.ini playbook.yml
```

### 5️⃣ Verify it's live
```bash
curl http://<public-ip>
```
Or just open `http://<public-ip>` in your browser. 🎉

### 6️⃣ Tear it down
```bash
cd ../terraform
terraform destroy
```

---

## ⚖️ Terraform vs Ansible

| | 🟣 Terraform | 🔴 Ansible |
|---|:---|:---|
| **Role** | Provisions infrastructure | Configures existing infrastructure |
| **Manages** | EC2 instances, security groups, networking | Packages, users, services, files |
| **State** | Tracks resources in `terraform.tfstate` | Checks the live system on every run |
| **Mental model** | "Build the house" | "Furnish and set up the house" |

---

<div align="center">

### 👤 Author

**Mahendra Swain**
DevOps / Cloud Engineering Internship — Davine Technologies (Week 6)

</div>

# portfolio-devops

A personal portfolio project with automated CI/CD using GitHub Actions and Docker, deployed on an AWS EC2 server. This repo features separate workflows for pull requests and push events, ensuring robust code review and reliable production deployments.

## 🌐 Visit My  Website

Check out the deployed portfolio here: [https:pridhvi.randomsasi.in](https:pridhvi.randomsasi.in)

## 🚀 Features

- **CI/CD Workflows:**  
  - Separate workflows for pull requests (PRs) and push events.
  - PR workflow runs tests and checks before merging.
  - Push workflow builds, tests, and deploys the latest code automatically.

- **Automated Docker Builds:**  
  Uses a bash script to build and run the Docker image.

- **AWS EC2 Deployment:**  
  Deploys the latest build to an AWS EC2 server for live updates.

- **Error Notifications:**  
  Stay updated on the status of deployments and be alerted instantly if anything breaks.

## 🛠️ Tech Stack

- **Frontend:** CSS, JavaScript, HTML
- **DevOps:** GitHub Actions, Docker, Shell scripting
- **Cloud:** AWS EC2

## 🏗️ How It Works

1. **Pull Request Workflow:**  
   - Triggered on every PR.
   - Runs automated tests and checks to ensure code quality before merging.

2. **Push Workflow:**  
   - Triggered on every push to the main branch.
   - Builds and tests the project.
   - Builds a Docker image.
   - Executes a bash script on the AWS EC2 server to deploy the new Docker image.

3. **Automatic Deployment:**  
   The latest version is live on your EC2 instance after each successful push to main.

## 📦 Getting Started

> **Note:** Replace relevant values (like AWS credentials, server IP, etc.) in your workflow and scripts.

### Prerequisites

- AWS EC2 instance with Docker installed
- GitHub repository secrets set for secure access

### Local Development

```bash
# Build the Docker image
docker build -t portfolio-devops .

# Run the Docker container
docker run -p 80:80 portfolio-devops
```

### Manual Deployment

```bash
# SSH into your EC2 instance and run:
script/deploydocker.bash imagetag
```

## 📂 Project Structure

- `Dockerfile` – Blueprint for building the Docker image
- `.github/workflows/` – GitHub Actions CI/CD workflow files for PR and push events
- `script/deploydocker.bash` – Bash script for deployment on AWS EC2

## ⚡ Example Workflow

<details>
<summary>Pull Request CI Workflow</summary>

```yaml
on:
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      # ...run tests and checks...
```
</details>

<details>
<summary>Push CI/CD Workflow</summary>

```yaml
on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      # ...build, test, docker build/push, remote deploy steps...
```
</details>

## 📝 License

[MIT](LICENSE)

---

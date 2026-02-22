# Self Healing Containerized Web App on GCP
This project demonstrates a self healing web service deployed on a GCP VM
using Docker, automated monitoring, and CI/CD. The system detects container failures and automatically restores service
availability without manual intervention.


## Features

- Containerized Flask web service
- Health check endpoint
- Failure injection via '/break' endpoint
- Automated monitoring using cron
- Self-healing via container restart
- CI/CD pipeline using GitHub Actions
- SSH-based deployment to GCP VM


## Failure Simulation

The '/break' endpoint intentionally crashes the application process
to simulate production failures.

The monitoring script detects container failure and automatically
restores service availability.


## Deployment Workflow

On every push to main branch:
1. GitHub runner connects to the VM via SSH
2. Pulls latest code
3. Rebuilds Docker image
4. Replaces current running container


## Monitoring Logic

The monitor script runs every minute via cron and:
- Verifies container is running through the '\health' endpoint
- Restarts container if unhealthy

## Tech Stack

- Python (Flask)
- Docker
- Bash scripting
- GitHub Actions
- GCP Compute Engine
- Linux (Ubuntu)

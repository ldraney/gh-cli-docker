# GitHub CLI Docker Setup

Dockerized GitHub CLI with persistent auth and scripts for common operations.

## Quick Start

```bash
# Clone this repo
git clone https://github.com/yourusername/gh-cli-docker.git
cd gh-cli-docker

# Run auth script once to set up credentials
docker compose run --rm gh /scripts/auth.sh

# Initialize a new project (creates and pushes to a new repo)
docker compose run --rm gh /scripts/init-project.sh my-new-repo
```

## Scripts

- `auth.sh`: One-time authentication that persists in a Docker volume
- `init-project.sh <repo-name>`: Creates a new repo and pushes current directory to it

## Optional Aliases

Add to `~/.bashrc` or `~/.zshrc`:
```bash
alias gh-docker='docker compose run --rm gh'
alias gh-init='docker compose run --rm gh /scripts/init-project.sh'
```

## Requirements

- Docker
- Docker Compose

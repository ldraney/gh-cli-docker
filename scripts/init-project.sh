#!/bin/bash

# Exit on any error
set -e

# Check if repository name was provided
if [ -z "$1" ]; then
    echo "Error: Please provide a repository name"
    echo "Usage: $0 <repository-name>"
    exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed"
    exit 1
fi

# Check if gh cli is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed"
    exit 1
fi

# Use provided repository name
repo_name="$1"

# Configure Git
git config --global --add safe.directory /work
git config --global init.defaultBranch main
git config --global user.email "$(gh api user | jq -r .email)"
git config --global user.name "$(gh api user | jq -r .name)"

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
fi

# Add all existing files
echo "Adding files to git..."
git add .

# Initial commit
echo "Creating initial commit..."
git commit -m "Initial commit"

# Create GitHub repository and push
echo "Creating GitHub repository '$repo_name'..."
gh repo create "$repo_name" --public --source=. --push

echo "Successfully initialized and pushed repository to GitHub!"

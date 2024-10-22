#!/bin/bash
# scripts/create-repo.sh
if [ -z "$1" ]; then
    echo "Error: Repository name is required"
    echo "Usage: $0 <repository-name>"
    exit 1
fi

echo "Creating new repository: $1"
gh repo create "$1" --public --confirm
echo "Repository created successfully: $1"


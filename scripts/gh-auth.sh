#!/bin/bash
# scripts/gh-auth.sh
echo "Checking GitHub CLI authentication status..."
if ! gh auth status &>/dev/null; then
    echo "Not authenticated. Starting GitHub CLI authentication..."
    gh auth login --with-token $GH_TOKEN
else
    echo "Already authenticated!"
fi



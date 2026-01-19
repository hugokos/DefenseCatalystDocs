#!/bin/bash

# Defense Catalyst Documentation Setup Script
# This script helps you deploy the documentation to GitHub Pages

echo "🚀 Defense Catalyst Documentation Setup"
echo "========================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Error: Git is not installed"
    echo "Please install Git first: https://git-scm.com/downloads"
    exit 1
fi

# Get GitHub username
echo "📝 Step 1: Configuration"
echo ""
read -p "Enter your GitHub username: " github_username

if [ -z "$github_username" ]; then
    echo "❌ Error: GitHub username is required"
    exit 1
fi

# Update _config.yml
echo "Updating _config.yml..."
sed -i.bak "s/yourusername/$github_username/g" _config.yml
rm _config.yml.bak 2>/dev/null
echo "✅ Configuration updated"
echo ""

# Initialize git repository
echo "📦 Step 2: Initialize Git Repository"
echo ""

if [ -d ".git" ]; then
    echo "⚠️  Git repository already initialized"
else
    git init
    echo "✅ Git repository initialized"
fi
echo ""

# Add files
echo "📁 Step 3: Add Files"
echo ""
git add .
echo "✅ Files added"
echo ""

# Commit
echo "💾 Step 4: Create Initial Commit"
echo ""
git commit -m "Initial documentation site"
echo "✅ Initial commit created"
echo ""

# Set main branch
echo "🌿 Step 5: Set Main Branch"
echo ""
git branch -M main
echo "✅ Main branch set"
echo ""

# Add remote
echo "🔗 Step 6: Add Remote Repository"
echo ""
remote_url="https://github.com/$github_username/DefenseCatalystDocs.git"
git remote add origin "$remote_url" 2>/dev/null || git remote set-url origin "$remote_url"
echo "✅ Remote repository configured"
echo ""

# Push to GitHub
echo "⬆️  Step 7: Push to GitHub"
echo ""
echo "Pushing to $remote_url..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub"
    echo ""
    echo "🎉 Setup Complete!"
    echo ""
    echo "Next steps:"
    echo "1. Go to https://github.com/$github_username/DefenseCatalystDocs"
    echo "2. Click Settings → Pages"
    echo "3. Set Source to: Branch 'main', folder '/ (root)'"
    echo "4. Click Save"
    echo "5. Wait 1-2 minutes for build to complete"
    echo "6. Visit: https://$github_username.github.io/DefenseCatalystDocs/"
    echo ""
    echo "📚 Documentation:"
    echo "- Quick Setup: QUICK_SETUP.md"
    echo "- Detailed Guide: DEPLOYMENT.md"
    echo "- Checklist: CHECKLIST.md"
else
    echo "❌ Error: Failed to push to GitHub"
    echo ""
    echo "Possible issues:"
    echo "1. Repository doesn't exist on GitHub"
    echo "   → Create it at: https://github.com/new"
    echo "   → Name: DefenseCatalystDocs"
    echo "   → Make it public"
    echo ""
    echo "2. Authentication failed"
    echo "   → Set up SSH keys or use personal access token"
    echo "   → See: https://docs.github.com/en/authentication"
    echo ""
    echo "3. Repository already exists with content"
    echo "   → Force push: git push -u origin main --force"
    exit 1
fi

#!/bin/bash
# Defense Catalyst Documentation - GitHub Pages Deployment Script
# Bash script for Linux/Mac

echo -e "\033[0;36mDefense Catalyst Documentation - GitHub Pages Setup\033[0m"
echo -e "\033[0;36m======================================================\033[0m"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo -e "\033[0;31mERROR: Git is not installed\033[0m"
    echo -e "\033[0;33mPlease install Git first\033[0m"
    exit 1
fi

# Get GitHub username
echo -e "\033[0;32mStep 1: GitHub Repository Setup\033[0m"
echo -e "\033[0;32m--------------------------------\033[0m"
read -p "Enter your GitHub username: " username

if [ -z "$username" ]; then
    echo -e "\033[0;31mERROR: Username cannot be empty\033[0m"
    exit 1
fi

echo ""
echo -e "\033[0;32mStep 2: Create GitHub Repository\033[0m"
echo -e "\033[0;32m---------------------------------\033[0m"
echo -e "\033[0;33m1. Go to: https://github.com/new\033[0m"
echo -e "\033[0;33m2. Repository name: DefenseCatalystDocs\033[0m"
echo -e "\033[0;33m3. Visibility: Public\033[0m"
echo -e "\033[0;33m4. Do NOT initialize with README\033[0m"
echo -e "\033[0;33m5. Click 'Create repository'\033[0m"
echo ""
read -p "Have you created the repository? (y/n): " created

if [ "$created" != "y" ] && [ "$created" != "Y" ]; then
    echo -e "\033[0;33mPlease create the repository first, then run this script again.\033[0m"
    exit 0
fi

# Initialize Git repository
echo ""
echo -e "\033[0;32mStep 3: Initializing Git Repository\033[0m"
echo -e "\033[0;32m------------------------------------\033[0m"

if [ -d .git ]; then
    echo -e "\033[0;33mGit repository already initialized\033[0m"
else
    git init
    echo -e "\033[0;36mGit repository initialized\033[0m"
fi

# Update configuration files
echo ""
echo -e "\033[0;32mStep 4: Updating Configuration\033[0m"
echo -e "\033[0;32m-------------------------------\033[0m"

# Update _config.yml
if [ -f "_config.yml" ]; then
    sed -i.bak "s|url: \"https://yourusername.github.io\"|url: \"https://$username.github.io\"|g" _config.yml
    rm _config.yml.bak 2>/dev/null
    echo -e "\033[0;36mUpdated _config.yml with your username\033[0m"
fi

# Update README.md
if [ -f "README.md" ]; then
    sed -i.bak "s|https://yourusername.github.io/DefenseCatalystDocs/|https://$username.github.io/DefenseCatalystDocs/|g" README.md
    rm README.md.bak 2>/dev/null
    echo -e "\033[0;36mUpdated README.md with your username\033[0m"
fi

# Add all files
echo ""
echo -e "\033[0;32mStep 5: Staging Files\033[0m"
echo -e "\033[0;32m---------------------\033[0m"
git add .
echo -e "\033[0;36mAll files staged for commit\033[0m"

# Create initial commit
echo ""
echo -e "\033[0;32mStep 6: Creating Initial Commit\033[0m"
echo -e "\033[0;32m--------------------------------\033[0m"
git commit -m "Initial Defense Catalyst documentation site"
echo -e "\033[0;36mInitial commit created\033[0m"

# Rename branch to main
echo ""
echo -e "\033[0;32mStep 7: Setting Main Branch\033[0m"
echo -e "\033[0;32m---------------------------\033[0m"
git branch -M main
echo -e "\033[0;36mBranch renamed to main\033[0m"

# Add remote
echo ""
echo -e "\033[0;32mStep 8: Adding Remote Repository\033[0m"
echo -e "\033[0;32m---------------------------------\033[0m"
remoteUrl="https://github.com/$username/DefenseCatalystDocs.git"

# Check if remote already exists
if git remote get-url origin &> /dev/null; then
    existingRemote=$(git remote get-url origin)
    echo -e "\033[0;33mRemote 'origin' already exists: $existingRemote\033[0m"
    read -p "Update remote URL? (y/n): " updateRemote
    if [ "$updateRemote" = "y" ] || [ "$updateRemote" = "Y" ]; then
        git remote set-url origin "$remoteUrl"
        echo -e "\033[0;36mRemote URL updated\033[0m"
    fi
else
    git remote add origin "$remoteUrl"
    echo -e "\033[0;36mRemote 'origin' added: $remoteUrl\033[0m"
fi

# Push to GitHub
echo ""
echo -e "\033[0;32mStep 9: Pushing to GitHub\033[0m"
echo -e "\033[0;32m-------------------------\033[0m"
echo -e "\033[0;33mPushing to GitHub...\033[0m"

if git push -u origin main; then
    echo -e "\033[0;32mSuccessfully pushed to GitHub!\033[0m"
else
    echo -e "\033[0;31mERROR: Failed to push to GitHub\033[0m"
    echo -e "\033[0;33mThis might be due to authentication issues.\033[0m"
    echo -e "\033[0;33mPlease ensure you have:\033[0m"
    echo -e "\033[0;33m  1. GitHub credentials configured\033[0m"
    echo -e "\033[0;33m  2. Personal access token (if using HTTPS)\033[0m"
    echo -e "\033[0;33m  3. SSH key configured (if using SSH)\033[0m"
    echo ""
    echo -e "\033[0;33mTry pushing manually with: git push -u origin main\033[0m"
    exit 1
fi

# Next steps
echo ""
echo -e "\033[0;32m========================================\033[0m"
echo -e "\033[0;32mSUCCESS! Repository pushed to GitHub\033[0m"
echo -e "\033[0;32m========================================\033[0m"
echo ""
echo -e "\033[0;36mNext Steps:\033[0m"
echo -e "\033[0;33m1. Go to: https://github.com/$username/DefenseCatalystDocs/settings/pages\033[0m"
echo -e "\033[0;33m2. Under 'Source', select:\033[0m"
echo -e "\033[0;33m   - Deploy from a branch\033[0m"
echo -e "\033[0;33m   - Branch: main\033[0m"
echo -e "\033[0;33m   - Folder: / (root)\033[0m"
echo -e "\033[0;33m3. Click 'Save'\033[0m"
echo -e "\033[0;33m4. Wait 1-2 minutes for deployment\033[0m"
echo -e "\033[0;33m5. Visit: https://$username.github.io/DefenseCatalystDocs/\033[0m"
echo ""
echo -e "\033[0;36mFor detailed instructions, see GITHUB_PAGES_SETUP.md\033[0m"
echo ""

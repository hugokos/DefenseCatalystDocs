# Defense Catalyst Documentation Setup Script (PowerShell)
# This script helps you deploy the documentation to GitHub Pages

Write-Host "🚀 Defense Catalyst Documentation Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "❌ Error: Git is not installed" -ForegroundColor Red
    Write-Host "Please install Git first: https://git-scm.com/downloads"
    exit 1
}

# Get GitHub username
Write-Host "📝 Step 1: Configuration" -ForegroundColor Yellow
Write-Host ""
$github_username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrWhiteSpace($github_username)) {
    Write-Host "❌ Error: GitHub username is required" -ForegroundColor Red
    exit 1
}

# Update _config.yml
Write-Host "Updating _config.yml..."
$config = Get-Content "_config.yml" -Raw
$config = $config -replace "yourusername", $github_username
Set-Content "_config.yml" -Value $config
Write-Host "✅ Configuration updated" -ForegroundColor Green
Write-Host ""

# Initialize git repository
Write-Host "📦 Step 2: Initialize Git Repository" -ForegroundColor Yellow
Write-Host ""

if (Test-Path ".git") {
    Write-Host "⚠️  Git repository already initialized" -ForegroundColor Yellow
} else {
    git init
    Write-Host "✅ Git repository initialized" -ForegroundColor Green
}
Write-Host ""

# Add files
Write-Host "📁 Step 3: Add Files" -ForegroundColor Yellow
Write-Host ""
git add .
Write-Host "✅ Files added" -ForegroundColor Green
Write-Host ""

# Commit
Write-Host "💾 Step 4: Create Initial Commit" -ForegroundColor Yellow
Write-Host ""
git commit -m "Initial documentation site"
Write-Host "✅ Initial commit created" -ForegroundColor Green
Write-Host ""

# Set main branch
Write-Host "🌿 Step 5: Set Main Branch" -ForegroundColor Yellow
Write-Host ""
git branch -M main
Write-Host "✅ Main branch set" -ForegroundColor Green
Write-Host ""

# Add remote
Write-Host "🔗 Step 6: Add Remote Repository" -ForegroundColor Yellow
Write-Host ""
$remote_url = "https://github.com/$github_username/DefenseCatalystDocs.git"
try {
    git remote add origin $remote_url 2>$null
} catch {
    git remote set-url origin $remote_url
}
Write-Host "✅ Remote repository configured" -ForegroundColor Green
Write-Host ""

# Push to GitHub
Write-Host "⬆️  Step 7: Push to GitHub" -ForegroundColor Yellow
Write-Host ""
Write-Host "Pushing to $remote_url..."
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Successfully pushed to GitHub" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 Setup Complete!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Go to https://github.com/$github_username/DefenseCatalystDocs"
    Write-Host "2. Click Settings → Pages"
    Write-Host "3. Set Source to: Branch 'main', folder '/ (root)'"
    Write-Host "4. Click Save"
    Write-Host "5. Wait 1-2 minutes for build to complete"
    Write-Host "6. Visit: https://$github_username.github.io/DefenseCatalystDocs/"
    Write-Host ""
    Write-Host "📚 Documentation:" -ForegroundColor Cyan
    Write-Host "- Quick Setup: QUICK_SETUP.md"
    Write-Host "- Detailed Guide: DEPLOYMENT.md"
    Write-Host "- Checklist: CHECKLIST.md"
} else {
    Write-Host "❌ Error: Failed to push to GitHub" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible issues:" -ForegroundColor Yellow
    Write-Host "1. Repository doesn't exist on GitHub"
    Write-Host "   → Create it at: https://github.com/new"
    Write-Host "   → Name: DefenseCatalystDocs"
    Write-Host "   → Make it public"
    Write-Host ""
    Write-Host "2. Authentication failed"
    Write-Host "   → Set up SSH keys or use personal access token"
    Write-Host "   → See: https://docs.github.com/en/authentication"
    Write-Host ""
    Write-Host "3. Repository already exists with content"
    Write-Host "   → Force push: git push -u origin main --force"
    exit 1
}

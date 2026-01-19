# Defense Catalyst Documentation - GitHub Pages Deployment Script
# PowerShell script for Windows

Write-Host "Defense Catalyst Documentation - GitHub Pages Setup" -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Get GitHub username
Write-Host "Step 1: GitHub Repository Setup" -ForegroundColor Green
Write-Host "--------------------------------" -ForegroundColor Green
$username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "ERROR: Username cannot be empty" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Step 2: Create GitHub Repository" -ForegroundColor Green
Write-Host "---------------------------------" -ForegroundColor Green
Write-Host "1. Go to: https://github.com/new" -ForegroundColor Yellow
Write-Host "2. Repository name: DefenseCatalystDocs" -ForegroundColor Yellow
Write-Host "3. Visibility: Public" -ForegroundColor Yellow
Write-Host "4. Do NOT initialize with README" -ForegroundColor Yellow
Write-Host "5. Click 'Create repository'" -ForegroundColor Yellow
Write-Host ""
$created = Read-Host "Have you created the repository? (y/n)"

if ($created -ne "y" -and $created -ne "Y") {
    Write-Host "Please create the repository first, then run this script again." -ForegroundColor Yellow
    exit 0
}

# Initialize Git repository
Write-Host ""
Write-Host "Step 3: Initializing Git Repository" -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green

if (Test-Path .git) {
    Write-Host "Git repository already initialized" -ForegroundColor Yellow
} else {
    git init
    Write-Host "Git repository initialized" -ForegroundColor Cyan
}

# Update configuration files
Write-Host ""
Write-Host "Step 4: Updating Configuration" -ForegroundColor Green
Write-Host "-------------------------------" -ForegroundColor Green

# Update _config.yml
$configPath = "_config.yml"
if (Test-Path $configPath) {
    $config = Get-Content $configPath -Raw
    $config = $config -replace 'url: "https://yourusername\.github\.io"', "url: `"https://$username.github.io`""
    Set-Content $configPath $config
    Write-Host "Updated _config.yml with your username" -ForegroundColor Cyan
}

# Update README.md
$readmePath = "README.md"
if (Test-Path $readmePath) {
    $readme = Get-Content $readmePath -Raw
    $readme = $readme -replace 'https://yourusername\.github\.io/DefenseCatalystDocs/', "https://$username.github.io/DefenseCatalystDocs/"
    Set-Content $readmePath $readme
    Write-Host "Updated README.md with your username" -ForegroundColor Cyan
}

# Add all files
Write-Host ""
Write-Host "Step 5: Staging Files" -ForegroundColor Green
Write-Host "---------------------" -ForegroundColor Green
git add .
Write-Host "All files staged for commit" -ForegroundColor Cyan

# Create initial commit
Write-Host ""
Write-Host "Step 6: Creating Initial Commit" -ForegroundColor Green
Write-Host "--------------------------------" -ForegroundColor Green
git commit -m "Initial Defense Catalyst documentation site"
Write-Host "Initial commit created" -ForegroundColor Cyan

# Rename branch to main
Write-Host ""
Write-Host "Step 7: Setting Main Branch" -ForegroundColor Green
Write-Host "---------------------------" -ForegroundColor Green
git branch -M main
Write-Host "Branch renamed to main" -ForegroundColor Cyan

# Add remote
Write-Host ""
Write-Host "Step 8: Adding Remote Repository" -ForegroundColor Green
Write-Host "---------------------------------" -ForegroundColor Green
$remoteUrl = "https://github.com/$username/DefenseCatalystDocs.git"

# Check if remote already exists
$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "Remote 'origin' already exists: $existingRemote" -ForegroundColor Yellow
    $updateRemote = Read-Host "Update remote URL? (y/n)"
    if ($updateRemote -eq "y" -or $updateRemote -eq "Y") {
        git remote set-url origin $remoteUrl
        Write-Host "Remote URL updated" -ForegroundColor Cyan
    }
} else {
    git remote add origin $remoteUrl
    Write-Host "Remote 'origin' added: $remoteUrl" -ForegroundColor Cyan
}

# Push to GitHub
Write-Host ""
Write-Host "Step 9: Pushing to GitHub" -ForegroundColor Green
Write-Host "-------------------------" -ForegroundColor Green
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow

try {
    git push -u origin main
    Write-Host "Successfully pushed to GitHub!" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Failed to push to GitHub" -ForegroundColor Red
    Write-Host "This might be due to authentication issues." -ForegroundColor Yellow
    Write-Host "Please ensure you have:" -ForegroundColor Yellow
    Write-Host "  1. GitHub credentials configured" -ForegroundColor Yellow
    Write-Host "  2. Personal access token (if using HTTPS)" -ForegroundColor Yellow
    Write-Host "  3. SSH key configured (if using SSH)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Try pushing manually with: git push -u origin main" -ForegroundColor Yellow
    exit 1
}

# Next steps
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "SUCCESS! Repository pushed to GitHub" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Go to: https://github.com/$username/DefenseCatalystDocs/settings/pages" -ForegroundColor Yellow
Write-Host "2. Under 'Source', select:" -ForegroundColor Yellow
Write-Host "   - Deploy from a branch" -ForegroundColor Yellow
Write-Host "   - Branch: main" -ForegroundColor Yellow
Write-Host "   - Folder: / (root)" -ForegroundColor Yellow
Write-Host "3. Click 'Save'" -ForegroundColor Yellow
Write-Host "4. Wait 1-2 minutes for deployment" -ForegroundColor Yellow
Write-Host "5. Visit: https://$username.github.io/DefenseCatalystDocs/" -ForegroundColor Yellow
Write-Host ""
Write-Host "For detailed instructions, see GITHUB_PAGES_SETUP.md" -ForegroundColor Cyan
Write-Host ""

# Deployment Guide for GitHub Pages

This guide will help you deploy the Defense Catalyst documentation to GitHub Pages.

## Prerequisites

- GitHub account
- Git installed locally
- Text editor

## Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and log in
2. Click the **+** icon in the top right and select **New repository**
3. Repository settings:
   - **Name**: `DefenseCatalystDocs`
   - **Description**: "Official user documentation for Defense Catalyst"
   - **Visibility**: Public (required for free GitHub Pages)
   - **Initialize**: Do NOT initialize with README (we already have files)
4. Click **Create repository**

## Step 2: Update Configuration

Before pushing, update `_config.yml` with your GitHub username:

```yaml
url: "https://YOUR_GITHUB_USERNAME.github.io"
```

Replace `YOUR_GITHUB_USERNAME` with your actual GitHub username.

## Step 3: Initialize and Push

Open terminal in the `DefenseCatalystDocs` directory and run:

```bash
# Initialize git repository
git init

# Add all files
git add .

# Commit
git commit -m "Initial documentation site"

# Set main branch
git branch -M main

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/DefenseCatalystDocs.git

# Push to GitHub
git push -u origin main
```

## Step 4: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** (top menu)
3. Scroll down and click **Pages** (left sidebar)
4. Under **Source**:
   - Branch: `main`
   - Folder: `/ (root)`
5. Click **Save**

GitHub will start building your site. This takes 1-2 minutes.

## Step 5: Verify Deployment

1. Wait for the build to complete (green checkmark in Actions tab)
2. Your site will be available at:
   ```
   https://YOUR_USERNAME.github.io/DefenseCatalystDocs/
   ```
3. Click the link in the Pages settings to view your site

## Step 6: Test the Site

Visit your site and verify:
- [ ] Home page loads correctly
- [ ] Navigation works
- [ ] All links work
- [ ] Styling is applied
- [ ] Images load (if any)

## Updating Documentation

To update the documentation:

```bash
# Make your changes to markdown files

# Commit changes
git add .
git commit -m "Update documentation"

# Push to GitHub
git push origin main
```

GitHub Pages will automatically rebuild your site (takes 1-2 minutes).

## Custom Domain (Optional)

To use a custom domain like `docs.defensecatalyst.com`:

1. Add a `CNAME` file to the repository root:
   ```
   docs.defensecatalyst.com
   ```

2. Configure DNS with your domain provider:
   - Add a CNAME record pointing to `YOUR_USERNAME.github.io`

3. In GitHub Pages settings:
   - Enter your custom domain
   - Enable "Enforce HTTPS"

## Troubleshooting

### Site Not Building

**Check the Actions tab** for build errors:
1. Go to repository → Actions tab
2. Click on the latest workflow run
3. Review error messages

**Common issues:**
- Invalid YAML in `_config.yml`
- Missing required files
- Syntax errors in markdown

### 404 Errors

**If pages show 404:**
- Verify file names match links (case-sensitive)
- Check `baseurl` in `_config.yml` matches repository name
- Ensure files have `.md` extension

### Styling Not Applied

**If CSS doesn't load:**
- Check `assets/css/style.scss` exists
- Verify front matter (`---`) at top of style.scss
- Clear browser cache

### Links Not Working

**If internal links break:**
- Use relative URLs without `.md` extension
- Example: `[Getting Started](getting-started)` not `[Getting Started](getting-started.md)`
- Check `baseurl` in `_config.yml`

## Local Development

To test locally before pushing:

### Install Ruby and Bundler

**macOS:**
```bash
brew install ruby
gem install bundler
```

**Windows:**
Download from [rubyinstaller.org](https://rubyinstaller.org/)

**Linux:**
```bash
sudo apt-get install ruby-full build-essential
gem install bundler
```

### Run Local Server

```bash
# Install dependencies
bundle install

# Start server
bundle exec jekyll serve

# View at http://localhost:4000/DefenseCatalystDocs/
```

The site will auto-reload when you make changes.

## GitHub Actions (Optional)

For advanced builds, create `.github/workflows/pages.yml`:

```yaml
name: Deploy Jekyll site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.1'
          bundler-cache: true
      - name: Setup Pages
        uses: actions/configure-pages@v4
      - name: Build with Jekyll
        run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

## Maintenance

### Regular Updates

**Weekly:**
- Review and update changelog
- Check for broken links
- Update screenshots if UI changed

**Monthly:**
- Review all documentation for accuracy
- Update integration guides
- Check analytics for popular pages

**After Product Updates:**
- Update affected documentation
- Add new features to changelog
- Update screenshots

### Monitoring

Track site usage with Google Analytics (optional):

1. Get tracking ID from Google Analytics
2. Add to `_config.yml`:
   ```yaml
   google_analytics: G-XXXXXXXXXX
   ```
3. Commit and push

## Support

For issues with:
- **GitHub Pages**: [GitHub Pages Documentation](https://docs.github.com/en/pages)
- **Jekyll**: [Jekyll Documentation](https://jekyllrb.com/docs/)
- **This site**: Open an issue in the repository

---

**Congratulations!** Your documentation site is now live on GitHub Pages. 🎉


# GitHub Pages Setup Guide

Complete guide to deploying Defense Catalyst Documentation to GitHub Pages.

## Prerequisites

- GitHub account
- Git installed locally
- Ruby 2.7+ and Bundler (for local testing)

## Step-by-Step Setup

### 1. Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `DefenseCatalystDocs`
3. Description: "Official documentation for Defense Catalyst Missions"
4. Visibility: **Public** (required for free GitHub Pages)
5. Do NOT initialize with README (we already have one)
6. Click "Create repository"

### 2. Initialize Git and Push

From the `DefenseCatalystDocs` directory:

```bash
# Initialize Git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial Defense Catalyst documentation site"

# Rename branch to main
git branch -M main

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/DefenseCatalystDocs.git

# Push to GitHub
git push -u origin main
```

### 3. Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** (top right)
3. Scroll down to **Pages** section (left sidebar)
4. Under "Source":
   - Select **Deploy from a branch**
   - Branch: **main**
   - Folder: **/ (root)**
5. Click **Save**

GitHub will start building your site. This takes 1-2 minutes.

### 4. Configure Custom Domain

The site is configured for custom domain: **https://docs.defensecatalyst.com/**

**DNS Setup Required:**
1. See [DNS_SETUP.md](DNS_SETUP.md) for detailed instructions
2. Add CNAME record: `docs` → `hugokos.github.io`
3. Wait for DNS propagation (15 min - 48 hours)
4. Configure in GitHub Settings > Pages > Custom domain
5. Enable "Enforce HTTPS" after verification

**Current Configuration:**
- ✅ `_config.yml`: `url: "https://docs.defensecatalyst.com"`, `baseurl: ""`
- ✅ `CNAME` file: `docs.defensecatalyst.com`
- ✅ `README.md`: Updated with custom domain URL

### 5. Verify Deployment

1. Wait 1-2 minutes for rebuild
2. Visit your site: `https://YOUR_USERNAME.github.io/DefenseCatalystDocs/`
3. Check that:
   - Home page loads correctly
   - Navigation works
   - Styles are applied
   - All links work

## Troubleshooting

### Site Not Loading

**Check build status:**
1. Go to repository **Actions** tab
2. Look for "pages build and deployment" workflow
3. If failed, click to see error details

**Common issues:**
- Gemfile.lock conflicts: Delete and regenerate locally
- Invalid YAML in _config.yml: Validate syntax
- Missing dependencies: Check Gemfile

### Styles Not Loading

**Issue**: CSS not applied, site looks plain

**Solution**:
1. Verify `baseurl` in `_config.yml` matches repo name
2. Check `assets/css/style.scss` exists
3. Clear browser cache and hard refresh (Ctrl+F5)

### 404 Errors on Pages

**Issue**: Links return 404 errors

**Solution**:
1. Ensure file names match exactly (case-sensitive)
2. Use `.html` extension in links or configure permalink
3. Check `baseurl` is correct in all links

### Build Warnings

**Issue**: "GitHub Metadata: No GitHub API authentication" warning

**Solution**: This is normal and doesn't affect functionality. To fix:
1. Go to Settings > Developer settings > Personal access tokens
2. Generate token with `public_repo` scope
3. Add to repository secrets as `GITHUB_TOKEN`

## Local Development

### First-Time Setup

```bash
# Install Ruby dependencies
bundle install

# Start local server
bundle exec jekyll serve

# View at http://localhost:4000/DefenseCatalystDocs/
```

### Making Changes

```bash
# 1. Make edits to markdown files

# 2. Test locally
bundle exec jekyll serve

# 3. Commit and push
git add .
git commit -m "Update documentation"
git push

# 4. Wait 1-2 minutes for GitHub Pages to rebuild
```

## Custom Domain (Optional)

To use a custom domain like `docs.defensecatalyst.com`:

### 1. Configure DNS

Add DNS records with your domain provider:

```
Type: CNAME
Name: docs (or subdomain of choice)
Value: YOUR_USERNAME.github.io
```

### 2. Configure GitHub Pages

1. Go to Settings > Pages
2. Under "Custom domain", enter: `docs.defensecatalyst.com`
3. Click Save
4. Wait for DNS check (can take up to 24 hours)
5. Enable "Enforce HTTPS" once DNS is verified

### 3. Update Configuration

Edit `_config.yml`:
```yaml
url: "https://docs.defensecatalyst.com"
baseurl: ""  # Empty for custom domain
```

## Automation

### Auto-Deploy on Push

GitHub Pages automatically rebuilds when you push to `main` branch.

**Workflow:**
1. Edit files locally
2. Commit changes
3. Push to GitHub
4. GitHub Actions builds site
5. Site updates in 1-2 minutes

### Build Status Badge

Add to README.md:
```markdown
![GitHub Pages](https://github.com/YOUR_USERNAME/DefenseCatalystDocs/actions/workflows/pages/pages-build-deployment/badge.svg)
```

## Security

### Public Repository

- Documentation is public (required for free GitHub Pages)
- Do NOT include sensitive information
- Do NOT commit API keys or credentials
- Review all content before publishing

### Private Repository (GitHub Pro)

If you need private documentation:
1. Upgrade to GitHub Pro
2. Make repository private
3. GitHub Pages still works with Pro account

## Maintenance

### Regular Updates

- Update documentation with each platform release
- Review and fix broken links monthly
- Update screenshots when UI changes
- Keep changelog.md current

### Monitoring

- Check GitHub Actions for build failures
- Monitor site analytics (if configured)
- Review user feedback and issues
- Test site after major updates

## Support

### GitHub Pages Documentation
- https://docs.github.com/en/pages

### Jekyll Documentation
- https://jekyllrb.com/docs/

### Theme Documentation
- https://github.com/pages-themes/cayman

## Checklist

Use this checklist for initial setup:

- [ ] Create GitHub repository
- [ ] Initialize Git in DefenseCatalystDocs directory
- [ ] Push to GitHub
- [ ] Enable GitHub Pages in Settings
- [ ] Wait for initial build (1-2 minutes)
- [ ] Update _config.yml with correct URL
- [ ] Update README.md with correct URL
- [ ] Commit and push URL updates
- [ ] Verify site loads correctly
- [ ] Test all navigation links
- [ ] Test all internal page links
- [ ] Verify styles are applied
- [ ] Check mobile responsiveness
- [ ] Add repository to bookmarks
- [ ] Share site URL with team

---

**Next Steps**: See [DEPLOYMENT.md](DEPLOYMENT.md) for platform deployment guide.

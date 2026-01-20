# Defense Catalyst Documentation

Official user documentation for Defense Catalyst Missions - AI-powered workflow automation for defense operations.

🌐 **Live Site**: https://docs.defensecatalyst.com/

> **Note**: Custom domain configured. See [DNS_SETUP.md](DNS_SETUP.md) for DNS configuration instructions.

## About

This repository contains the public-facing user documentation for Defense Catalyst, built with Jekyll and GitHub Pages.

**Defense Catalyst** is a specialized fork of Activepieces optimized for defense technology and Department of Defense (DoD) use cases, featuring:
- Visual workflow builder with 280+ integrations
- AI-powered flow assistance (Copilot)
- Enterprise-grade security and compliance
- Self-hosted deployment on Railway
- Air-gapped deployment support

## Local Development

### Prerequisites
- Ruby 2.7+
- Bundler

### Setup

```bash
# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# View at http://localhost:4000/DefenseCatalystDocs/
```

## Deployment

This site automatically deploys to GitHub Pages when changes are pushed to the `main` branch.

### First-Time Setup

1. **Create GitHub Repository**
   ```bash
   # Create new repo on GitHub named "DefenseCatalystDocs"
   # Then push this directory
   git init
   git add .
   git commit -m "docs: initial documentation site"
   git branch -M main
   git remote add origin https://github.com/hugokos/DefenseCatalystDocs.git
   git push -u origin main
   ```

2. **Enable GitHub Pages**
   - Go to repository Settings
   - Navigate to Pages section
   - Source: Deploy from branch
   - Branch: `main` / `root`
   - Click Save

3. **Configure Custom Domain** (Already Done)
   - CNAME file created with `docs.defensecatalyst.com`
   - _config.yml updated with custom domain URL
   - See [DNS_SETUP.md](DNS_SETUP.md) for DNS configuration steps

## Structure

```
DefenseCatalystDocs/
├── _config.yml              # Jekyll configuration
├── _layouts/                # Page layouts
│   └── default.html         # Main layout template
├── assets/                  # Static assets
│   ├── css/
│   │   └── style.scss       # Custom styles
│   └── images/              # Images and logos
├── index.md                 # Home page
├── getting-started.md       # Quick start guide
├── first-workflow-tutorial.md  # Step-by-step tutorial
├── core-concepts.md         # Core concepts
├── integrations-directory.md   # All integrations
├── integration-*.md         # Individual integration guides
├── runs-logs-debugging.md   # Debugging guide
├── troubleshooting-hub.md   # Troubleshooting
├── error-reference.md       # Error codes
├── security-privacy.md      # Security docs
├── limits-reliability.md    # Limits and reliability
├── faq.md                   # FAQ
├── glossary.md              # Glossary
├── changelog.md             # Version history
└── contact-support.md       # Support info
```

## Contributing

To update documentation:

1. Edit markdown files
2. Test locally with `bundle exec jekyll serve`
3. Commit and push to `main` branch
4. GitHub Pages will automatically rebuild (takes 1-2 minutes)

### Writing Guidelines
- Use clear, concise language
- Include code examples where applicable
- Add screenshots for UI-related docs
- Follow existing document structure
- Test all links before committing

## Maintenance

### Updating Content
- Keep integration guides up-to-date with platform changes
- Update changelog.md for each release
- Review and update FAQ regularly
- Verify all links quarterly

### Adding New Pages
1. Create new `.md` file in root directory
2. Add front matter with title and layout
3. Update navigation in `_layouts/default.html` if needed
4. Add to relevant index pages

## Customization

### Branding
- Colors defined in `assets/css/style.scss`
- Logo in `assets/images/`
- Update `_config.yml` for site metadata

### Navigation
- Edit navigation in `_config.yml`
- Update nav links in `_layouts/default.html`

## License

This documentation is part of Defense Catalyst and follows the same licensing as the main project.

---

**Defense Catalyst** - AI-powered workflow automation for defense operations


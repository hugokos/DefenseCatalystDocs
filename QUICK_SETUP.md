# Quick Setup Guide

Get your Defense Catalyst documentation site live in 5 minutes!

## 🚀 Fast Track

### 1. Update Configuration (30 seconds)

Edit `_config.yml` and replace `yourusername` with your GitHub username:

```yaml
url: "https://YOUR_GITHUB_USERNAME.github.io"
```

### 2. Create GitHub Repository (1 minute)

1. Go to https://github.com/new
2. Name: `DefenseCatalystDocs`
3. Public repository
4. Don't initialize with README
5. Click "Create repository"

### 3. Push to GitHub (1 minute)

```bash
cd DefenseCatalystDocs
git init
git add .
git commit -m "Initial documentation site"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/DefenseCatalystDocs.git
git push -u origin main
```

### 4. Enable GitHub Pages (1 minute)

1. Go to repository Settings → Pages
2. Source: Branch `main`, folder `/ (root)`
3. Click Save

### 5. View Your Site (2 minutes)

Wait for build to complete, then visit:
```
https://YOUR_USERNAME.github.io/DefenseCatalystDocs/
```

## ✅ Verification Checklist

- [ ] Site loads at your GitHub Pages URL
- [ ] Navigation menu works
- [ ] Home page displays correctly
- [ ] Getting Started page loads
- [ ] Integration pages load
- [ ] Styling is applied (colors, layout)

## 🎨 Customization (Optional)

### Update Support Contact

Edit `contact-support.md` with your actual support information.

### Add Logo

1. Add logo image to `assets/images/logo.png`
2. Update `_config.yml`:
   ```yaml
   logo: /assets/images/logo.png
   ```

### Add Google Analytics

1. Get tracking ID from Google Analytics
2. Add to `_config.yml`:
   ```yaml
   google_analytics: G-XXXXXXXXXX
   ```

### Customize Colors

Edit `assets/css/style.scss` to change colors:

```scss
:root {
  --dc-inkwell: #2C3E50;      /* Primary color */
  --dc-au-lait: #F5F5DC;      /* Background */
  --dc-creme-brulee: #FFE5B4; /* Accent */
  --dc-accent: #3498db;       /* Links */
}
```

## 📝 Next Steps

1. **Review Content**: Read through all pages and customize as needed
2. **Add Screenshots**: Add images to illustrate workflows
3. **Update Changelog**: Add your version information
4. **Test All Links**: Click through every link to verify
5. **Share**: Send the URL to your team!

## 🆘 Troubleshooting

**Site not building?**
- Check Actions tab for errors
- Verify `_config.yml` syntax

**404 errors?**
- Check file names match links
- Verify `baseurl` in config

**Styling broken?**
- Clear browser cache
- Check `assets/css/style.scss` exists

**Need help?**
- See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed guide
- Check [GitHub Pages docs](https://docs.github.com/en/pages)

---

**That's it!** Your documentation site is live. 🎉

For detailed deployment instructions, see [DEPLOYMENT.md](DEPLOYMENT.md).


# Custom Domain Setup Walkthrough

## ✅ What's Already Done

1. **CNAME File Created**: `docs.defensecatalyst.com`
2. **_config.yml Updated**: 
   - `url: "https://docs.defensecatalyst.com"`
   - `baseurl: ""` (empty for custom domain)
3. **README.md Updated**: Points to custom domain
4. **DNS_SETUP.md Created**: Complete DNS configuration guide
5. **Pushed to GitHub**: All changes are live

## 🚀 What You Need to Do Now

### Step 1: Configure DNS (15 minutes)

1. **Log into your domain registrar** (where you bought defensecatalyst.com)
   - Namecheap, GoDaddy, Cloudflare, etc.

2. **Add CNAME Record**:
   ```
   Type: CNAME
   Name: docs
   Value: hugokos.github.io
   TTL: Automatic (or 3600)
   ```

3. **Save the DNS record**

4. **Wait for DNS propagation** (15 min - 48 hours, usually ~1 hour)
   - Check status: https://dnschecker.org/#CNAME/docs.defensecatalyst.com
   - Should show: `hugokos.github.io`

### Step 2: Configure GitHub Pages (5 minutes)

1. **Go to GitHub Pages Settings**:
   https://github.com/hugokos/DefenseCatalystDocs/settings/pages

2. **Under "Custom domain"**:
   - Enter: `docs.defensecatalyst.com`
   - Click **Save**

3. **Wait for DNS check** (green checkmark appears)
   - This can take a few minutes to 24 hours
   - GitHub verifies the DNS record

4. **Enable HTTPS** (after DNS verification):
   - Check the box: **Enforce HTTPS**
   - GitHub automatically provisions SSL certificate

### Step 3: Verify Site (2 minutes)

1. **Visit your site**: https://docs.defensecatalyst.com/

2. **Check that**:
   - ✅ Site loads correctly
   - ✅ HTTPS is working (padlock icon)
   - ✅ Navigation works
   - ✅ All pages load
   - ✅ Styles are applied

## 📋 Quick Checklist

- [ ] Log into domain registrar
- [ ] Add CNAME record: `docs` → `hugokos.github.io`
- [ ] Wait for DNS propagation (check dnschecker.org)
- [ ] Go to GitHub Pages settings
- [ ] Enter custom domain: `docs.defensecatalyst.com`
- [ ] Click Save
- [ ] Wait for DNS verification (green checkmark)
- [ ] Enable "Enforce HTTPS"
- [ ] Visit https://docs.defensecatalyst.com/
- [ ] Verify site works correctly

## 🐛 Troubleshooting

### DNS Not Propagating

**Check DNS status**:
```bash
nslookup docs.defensecatalyst.com
```

Should return: `hugokos.github.io`

**If not working**:
- Wait longer (can take up to 48 hours)
- Verify CNAME record is correct
- Check for typos in DNS settings
- Try different DNS checker: https://dnschecker.org/

### GitHub Pages Shows Error

**"Domain's DNS record could not be retrieved"**
- DNS hasn't propagated yet - wait and try again
- Verify CNAME record points to `hugokos.github.io`
- Check DNS with dnschecker.org

**"Domain is improperly configured"**
- Remove custom domain in GitHub settings
- Wait 5 minutes
- Re-add custom domain
- Save again

### HTTPS Not Working

**"Not secure" warning**
- Wait 24 hours after DNS verification
- GitHub needs time to provision SSL certificate
- Ensure "Enforce HTTPS" is checked
- Try clearing browser cache

## 📚 Detailed Guides

- **DNS Configuration**: See [DNS_SETUP.md](DNS_SETUP.md)
- **GitHub Pages Setup**: See [GITHUB_PAGES_SETUP.md](GITHUB_PAGES_SETUP.md)
- **Deployment Guide**: See [DEPLOYMENT.md](DEPLOYMENT.md)

## 🎯 Expected Timeline

| Step | Time |
|------|------|
| Add DNS record | 5 minutes |
| DNS propagation | 15 min - 48 hours (usually 1 hour) |
| Configure GitHub Pages | 5 minutes |
| DNS verification | 5 min - 24 hours |
| SSL certificate | Automatic (up to 24 hours) |
| **Total** | **1-2 hours typical, up to 48 hours max** |

## ✅ Success Indicators

When everything is working:
- ✅ https://docs.defensecatalyst.com/ loads
- ✅ Green padlock icon (HTTPS)
- ✅ No certificate warnings
- ✅ All pages accessible
- ✅ Navigation works
- ✅ Styles applied correctly

## 📞 Support

- **DNS Issues**: Contact your domain registrar support
- **GitHub Pages**: https://docs.github.com/en/pages
- **SSL Certificate**: https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https

---

**Current Status**: Configuration files ready, waiting for DNS setup
**Next Action**: Add CNAME DNS record with your domain registrar

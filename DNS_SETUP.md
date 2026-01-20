# DNS Configuration for Custom Domain

## Domain: docs.defensecatalyst.com

### DNS Records to Add

Add the following DNS records in your domain registrar's control panel (e.g., Namecheap, GoDaddy, Cloudflare):

#### Option 1: CNAME Record (Recommended for Subdomain)

```
Type: CNAME
Name: docs
Value: hugokos.github.io
TTL: Automatic (or 3600)
```

#### Option 2: A Records (Alternative - for apex domain)

If you want to use the apex domain (defensecatalyst.com), add these A records:

```
Type: A
Name: @
Value: 185.199.108.153
TTL: 3600

Type: A
Name: @
Value: 185.199.109.153
TTL: 3600

Type: A
Name: @
Value: 185.199.110.153
TTL: 3600

Type: A
Name: @
Value: 185.199.111.153
TTL: 3600
```

Then add CNAME for www:
```
Type: CNAME
Name: www
Value: hugokos.github.io
TTL: 3600
```

### Verification Steps

1. **Add DNS Records**
   - Log into your domain registrar
   - Navigate to DNS management
   - Add the CNAME record as shown above
   - Save changes

2. **Wait for DNS Propagation** (15 minutes - 48 hours)
   - Check status: https://dnschecker.org/#CNAME/docs.defensecatalyst.com
   - Should show: `hugokos.github.io`

3. **Configure GitHub Pages**
   - Go to: https://github.com/hugokos/DefenseCatalystDocs/settings/pages
   - Under "Custom domain", enter: `docs.defensecatalyst.com`
   - Click **Save**
   - Wait for DNS check (green checkmark)
   - Enable **Enforce HTTPS** (after DNS verification)

4. **Verify Site**
   - Visit: https://docs.defensecatalyst.com/
   - Should redirect to HTTPS automatically
   - Check certificate is valid (padlock icon)

### Troubleshooting

#### DNS Not Propagating

**Check DNS:**
```bash
nslookup docs.defensecatalyst.com
# Should return: hugokos.github.io
```

**Common Issues:**
- TTL too high (wait longer)
- Wrong record type (use CNAME, not A record for subdomain)
- Typo in value (must be exactly `hugokos.github.io`)

#### GitHub Pages Shows Error

**"Domain's DNS record could not be retrieved"**
- Wait 24 hours for full DNS propagation
- Verify CNAME record is correct
- Check DNS with: https://dnschecker.org/

**"Domain is improperly configured"**
- Remove and re-add custom domain in GitHub settings
- Verify CNAME file exists in repository
- Check DNS records are correct

#### HTTPS Not Working

**"Certificate error" or "Not secure"**
- Wait 24 hours after DNS verification
- Ensure "Enforce HTTPS" is enabled in GitHub Pages settings
- GitHub automatically provisions SSL certificate (can take time)

### Domain Registrar Guides

#### Namecheap
1. Dashboard → Domain List → Manage
2. Advanced DNS tab
3. Add New Record → CNAME Record
4. Host: `docs`, Value: `hugokos.github.io`

#### GoDaddy
1. My Products → DNS
2. Add → CNAME
3. Name: `docs`, Value: `hugokos.github.io`

#### Cloudflare
1. DNS → Add record
2. Type: CNAME, Name: `docs`, Target: `hugokos.github.io`
3. Proxy status: DNS only (gray cloud)

### Current Configuration

✅ **CNAME file created**: `docs.defensecatalyst.com`
✅ **_config.yml updated**: 
   - `url: "https://docs.defensecatalyst.com"`
   - `baseurl: ""`
✅ **README.md updated**: Points to custom domain

### Next Steps

1. [ ] Add CNAME DNS record with your domain registrar
2. [ ] Wait for DNS propagation (check with dnschecker.org)
3. [ ] Configure custom domain in GitHub Pages settings
4. [ ] Wait for DNS verification (green checkmark)
5. [ ] Enable "Enforce HTTPS"
6. [ ] Test site at https://docs.defensecatalyst.com/

### Support

- **GitHub Pages Custom Domain**: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
- **DNS Checker**: https://dnschecker.org/
- **SSL Certificate Issues**: https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https


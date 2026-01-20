# Email (SMTP) Integration

## What It Enables

Send automated emails from your workflows using SMTP:

- **Notifications**: Alert users about events and updates
- **Reports**: Send scheduled reports via email
- **Alerts**: Critical system notifications
- **Confirmations**: Order confirmations, registrations
- **Newsletters**: Automated email campaigns
- **Transactional Emails**: Receipts, password resets

## Prerequisites

- SMTP server access (Gmail, Outlook, SendGrid, etc.)
- SMTP credentials (username/password or API key)
- Sender email address
- Understanding of email deliverability basics

## How to Connect

### Step 1: Get SMTP Credentials

Choose your email provider:

#### **Gmail**
1. Enable 2-factor authentication
2. Generate App Password: [myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords)
3. Use App Password (not your regular password)
4. SMTP Server: `smtp.gmail.com`
5. Port: `587` (TLS) or `465` (SSL)

#### **Outlook/Office 365**
1. SMTP Server: `smtp.office365.com`
2. Port: `587`
3. Use your email and password
4. Enable SMTP AUTH in admin center

#### **SendGrid**
1. Create API key in SendGrid dashboard
2. SMTP Server: `smtp.sendgrid.net`
3. Port: `587`
4. Username: `apikey`
5. Password: Your API key

#### **Custom SMTP**
1. Get SMTP server address from provider
2. Get port number (usually 587, 465, or 25)
3. Get authentication credentials
4. Check TLS/SSL requirements

### Step 2: Add Email Action

1. In your flow, click "+" to add a step
2. Search for "Email" or "SMTP"
3. Select "Send Email" action

### Step 3: Configure Connection

1. Click "Connect" or "+ New Connection"
2. Enter SMTP details:
   - **SMTP Host**: Server address
   - **SMTP Port**: Port number
   - **Username**: Your email or username
   - **Password**: Password or API key
   - **From Email**: Sender address
   - **From Name**: Sender display name
3. Click "Test Connection"
4. Click "Save"

### Step 4: Compose Email

1. **To**: Recipient email(s)
2. **Subject**: Email subject line
3. **Body**: Email content (HTML or plain text)
4. **CC/BCC**: Optional additional recipients
5. **Attachments**: Optional files

### Step 5: Test

1. Click "Test" to send test email
2. Check recipient inbox (and spam folder)
3. Verify formatting and content

## Email Configuration

### Basic Fields

**To** (Required)
- Single email: `user@example.com`
- Multiple emails: `user1@example.com, user2@example.com`
- From data: `{{trigger.email}}`

**Subject** (Required)
```
Order Confirmation #{{trigger.order_id}}
```

**Body** (Required)
- Plain text or HTML
- Can include data from previous steps
- Use HTML for formatting

### Optional Fields

**CC** (Carbon Copy)
- Visible to all recipients
- Use for transparency

**BCC** (Blind Carbon Copy)
- Hidden from other recipients
- Use for privacy

**Reply-To**
- Different from sender
- Where replies should go

**Attachments**
- File URLs or base64 data
- Check size limits

## HTML Email Templates

### Simple Template
```html
<html>
<body>
  <h1>Hello {{trigger.name}}!</h1>
  <p>Thank you for your order.</p>
  <p>Order ID: <strong>{{trigger.order_id}}</strong></p>
  <p>Total: ${{trigger.total}}</p>
</body>
</html>
```

### Professional Template
```html
<html>
<head>
  <style>
    body { font-family: Arial, sans-serif; }
    .header { background: #2C3E50; color: white; padding: 20px; }
    .content { padding: 20px; }
    .button { background: #3498db; color: white; padding: 10px 20px; text-decoration: none; }
  </style>
</head>
<body>
  <div class="header">
    <h1>Defense Catalyst</h1>
  </div>
  <div class="content">
    <p>Hi {{trigger.name}},</p>
    <p>{{trigger.message}}</p>
    <a href="{{trigger.link}}" class="button">Take Action</a>
  </div>
</body>
</html>
```

### Responsive Template
Use inline CSS for better email client compatibility:
```html
<table width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      <table width="600" cellpadding="20">
        <tr>
          <td style="font-family: Arial; font-size: 16px;">
            Your content here
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
```

## Common Errors & Fixes

### "Authentication failed"
**Cause**: Invalid credentials
**Fix**:
1. Verify username and password are correct
2. For Gmail, use App Password (not regular password)
3. Check 2FA is enabled (if required)
4. Verify SMTP server address is correct

### "Connection timeout"
**Cause**: Cannot reach SMTP server
**Fix**:
1. Check SMTP server address
2. Verify port number (587, 465, or 25)
3. Check firewall isn't blocking connection
4. Try different port (TLS vs SSL)

### "Relay access denied"
**Cause**: SMTP server won't relay for your domain
**Fix**:
1. Authenticate with valid credentials
2. Use authorized sender address
3. Check SMTP server allows relay
4. Verify sender domain is authorized

### "Message rejected"
**Cause**: Email content or recipient rejected
**Fix**:
1. Check recipient email is valid
2. Verify sender email is authorized
3. Check for spam trigger words
4. Ensure HTML is valid
5. Check attachment size limits

### "TLS/SSL error"
**Cause**: Encryption configuration mismatch
**Fix**:
1. Try port 587 with TLS
2. Try port 465 with SSL
3. Check "Require TLS" setting
4. Update to latest TLS version

### "Rate limit exceeded"
**Cause**: Too many emails sent
**Fix**:
1. Check provider's sending limits
2. Reduce email frequency
3. Implement delays between sends
4. Upgrade to higher tier plan

## Test Checklist

- [ ] Connection successful
- [ ] Test email received
- [ ] Subject line correct
- [ ] Body content displays properly
- [ ] HTML formatting works
- [ ] Links are clickable
- [ ] Images load (if any)
- [ ] Not in spam folder
- [ ] Attachments included (if any)
- [ ] Reply-to address correct

## Tips & Best Practices

### Deliverability
- **Use reputable SMTP provider**: Gmail, SendGrid, etc.
- **Authenticate domain**: SPF, DKIM, DMARC records
- **Avoid spam words**: "Free", "Act now", excessive caps
- **Include unsubscribe**: For marketing emails
- **Monitor bounce rate**: Remove invalid addresses
- **Warm up new domains**: Start with low volume

### Content
- **Clear subject lines**: Descriptive, not clickbait
- **Personalize**: Use recipient name and relevant data
- **Mobile-friendly**: Test on mobile devices
- **Plain text alternative**: Include for accessibility
- **Test before sending**: Always send test emails
- **Proofread**: Check spelling and grammar

### Performance
- **Batch sending**: Group emails when possible
- **Async processing**: Don't block workflow
- **Handle failures**: Retry logic for temporary errors
- **Monitor metrics**: Track delivery, opens, clicks

### Security
- **Protect credentials**: Never expose SMTP passwords
- **Use TLS/SSL**: Encrypt email transmission
- **Validate inputs**: Prevent email injection
- **Limit recipients**: Prevent abuse
- **Audit logs**: Track who sends what

### Compliance
- **CAN-SPAM**: Include physical address, unsubscribe
- **GDPR**: Get consent, allow data deletion
- **CASL**: Canadian anti-spam law
- **Opt-out**: Honor unsubscribe requests immediately

## Advanced Patterns

### Dynamic Content
```html
<p>Hi {{trigger.name}},</p>

{{#if trigger.is_premium}}
  <p>As a premium member, you get exclusive benefits!</p>
{{else}}
  <p>Upgrade to premium for more features.</p>
{{/if}}
```

### Conditional Sending
```
Condition: Only send if {{trigger.email_enabled}} is true
Action: Send Email
```

### Email with Attachment
```
Attachment URL: {{trigger.report_url}}
Or
Attachment Data: {{trigger.file_base64}}
```

### Follow-up Sequence
```
1. Send welcome email immediately
2. Wait 3 days
3. Send tips email
4. Wait 7 days
5. Send survey email
```

### Error Notification
```
Trigger: Flow fails
Action: Send email to admin
Subject: "Flow Failed: {{flow.name}}"
Body: Error details and logs
```

## Email Provider Limits

### Gmail
- **Daily limit**: 500 emails/day (free), 2000/day (Workspace)
- **Recipients per email**: 500
- **Attachment size**: 25 MB

### Outlook
- **Daily limit**: 300 emails/day
- **Recipients per email**: 500
- **Attachment size**: 20 MB

### SendGrid
- **Free tier**: 100 emails/day
- **Paid tiers**: Up to millions/month
- **Rate limit**: Varies by plan

### Custom SMTP
- Check with your provider
- Typically 100-1000/hour
- May have monthly limits

## Alternatives

### For High Volume
- **SendGrid**: Transactional email service
- **Mailgun**: Developer-focused email API
- **Amazon SES**: Scalable email service
- **Postmark**: Transactional email

### For Marketing
- **Mailchimp**: Email marketing platform
- **Constant Contact**: Marketing automation
- **HubSpot**: Full marketing suite

### For Transactional
- **Twilio SendGrid**: Reliable delivery
- **Postmark**: Fast transactional emails
- **Amazon SES**: Cost-effective at scale

## Troubleshooting Deliverability

### Emails Going to Spam

**Check**:
1. SPF record configured
2. DKIM signature present
3. DMARC policy set
4. Sender reputation good
5. Content not spammy
6. Unsubscribe link present

**Tools**:
- [mail-tester.com](https://www.mail-tester.com) - Test spam score
- [mxtoolbox.com](https://mxtoolbox.com) - Check DNS records

### Emails Not Delivered

**Check**:
1. Recipient email valid
2. Not on blocklist
3. SMTP logs for errors
4. Bounce notifications
5. Provider sending limits

## Related Documentation

- [Core Concepts: Data Mapping](core-concepts.md#data-mapping)
- [Troubleshooting: Connection Problems](troubleshooting-hub.md#connectionauth-problems)
- [Error Reference](error-reference.md)
- [Limits & Reliability](limits-reliability.md)

## Example Use Cases

### Order Confirmation
New order → Format email → Send confirmation

### Daily Report
Schedule (daily) → Generate report → Email to team

### Error Alert
Flow fails → Format error details → Email to admin

### Welcome Email
New user → Send welcome email → Track engagement

### Password Reset
Reset request → Generate token → Email reset link

## Need Help?

- Check [Troubleshooting Hub](troubleshooting-hub.md)
- Review [Error Reference](error-reference.md)
- Contact [Support](contact-support.md)
- Test with [mail-tester.com](https://www.mail-tester.com)


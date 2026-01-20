# Security & Privacy Overview

## Overview

Defense Catalyst is built with security and privacy as core principles. This document explains how we protect your data, what security features are available, and best practices for secure automation.

**Note**: This is a public-friendly overview. For detailed security documentation, compliance certifications, and technical security details, contact our security team.

---

## Data Handling

### Where Your Data Lives

**Infrastructure**:
- Self-hosted on Railway platform
- Data stored in secure cloud infrastructure
- Geographic location: [Specify region]
- Compliant with data residency requirements

**Data Types**:
- **Flow Configurations**: Your workflow definitions
- **Run Data**: Execution history and logs
- **Connection Credentials**: Encrypted authentication data
- **User Information**: Account and workspace data

### Data Flow

```
Your Browser
    ↓ HTTPS (TLS 1.3)
Defense Catalyst Frontend
    ↓ HTTPS (TLS 1.3)
Defense Catalyst Backend
    ↓ Encrypted Connection
External Services (via your connections)
```

**Key Points**:
- All data encrypted in transit
- No data stored on your device
- External services accessed with your credentials
- Data isolated between workspaces

### Data Encryption

**In Transit**:
- TLS 1.3 encryption
- HTTPS for all connections
- Certificate pinning
- Perfect forward secrecy

**At Rest**:
- AES-256 encryption
- Encrypted database storage
- Encrypted backups
- Encrypted file storage

**Key Management**:
- Industry-standard key management
- Regular key rotation
- Secure key storage
- No customer access to encryption keys

---

## Secrets & Credentials

### How Connections Are Stored

**OAuth Tokens**:
- Encrypted at rest
- Automatically refreshed
- Revocable anytime
- Scoped to minimum permissions

**API Keys**:
- Encrypted at rest
- Never logged or displayed
- Masked in UI (shows last 4 characters)
- Rotatable

**Passwords**:
- Encrypted at rest
- Never displayed after entry
- Hashed using bcrypt
- Not recoverable (must reset)

### Who Can Access Connections

**Workspace Admins**:
- Can view connection names
- Can test connections
- Can delete connections
- **Cannot** view credentials

**Workspace Editors**:
- Can use existing connections
- Can create new connections
- **Cannot** view credentials
- **Cannot** delete others' connections

**Workspace Viewers**:
- Can see connection names
- **Cannot** use connections
- **Cannot** view credentials
- **Cannot** modify connections

### Credential Rotation

**Best Practices**:
- Rotate API keys every 90 days
- Regenerate OAuth tokens annually
- Update passwords regularly
- Remove unused connections

**How to Rotate**:
1. Generate new credentials in external service
2. Update connection in Defense Catalyst
3. Test connection
4. Revoke old credentials
5. Monitor for issues

---

## Access Controls

### User Roles

#### **Admin**
**Can**:
- Manage workspace settings
- Invite/remove users
- Assign roles
- View all flows
- Edit all flows
- Delete flows
- Manage connections
- View billing
- Access audit logs

**Cannot**:
- View connection credentials

#### **Editor**
**Can**:
- Create flows
- Edit own flows
- View all flows
- Create connections
- Use connections
- View run history
- Test flows

**Cannot**:
- Manage users
- Delete others' flows
- View billing
- Access audit logs
- View connection credentials

#### **Viewer**
**Can**:
- View flows
- View run history
- View connections (names only)

**Cannot**:
- Create/edit flows
- Create connections
- Execute flows
- Manage workspace
- View credentials

### Inviting Team Members

**Process**:
1. Admin sends invitation
2. User receives email
3. User creates account or signs in
4. User joins workspace with assigned role

**Security**:
- Invitation expires after 7 days
- Email verification required
- Can be revoked before acceptance
- Audit log entry created

### Removing Access

**When User Leaves**:
1. Admin removes user from workspace
2. User loses access immediately
3. User's flows remain (can be reassigned)
4. User's connections remain (can be deleted)
5. Audit log entry created

**Best Practices**:
- Remove access same day
- Review and reassign flows
- Rotate shared credentials
- Audit user's activities

---

## Compliance

### Defense-Focused Features

**DoD Compliance**:
- Enhanced security controls
- Audit logging
- Data residency options
- Air-gapped deployment support
- Compliance documentation available

**Security Features**:
- Role-based access control (RBAC)
- Multi-factor authentication (MFA)
- Single sign-on (SSO) - Enterprise
- IP whitelisting - Enterprise
- Advanced audit logs - Enterprise

### Air-Gapped Deployment

**What It Means**:
- No internet connectivity required
- Fully isolated network
- On-premises deployment
- Complete data control

**Available For**:
- Enterprise customers
- Government agencies
- High-security environments

**Contact**: Enterprise sales for air-gapped deployment options

### Audit Logging

**What's Logged**:
- User authentication
- Flow creation/modification
- Connection creation/deletion
- User management actions
- Configuration changes
- API access

**Retention**:
- Standard: 30 days
- Enterprise: 1 year
- Exportable for compliance

**Access**:
- Workspace admins only
- Read-only
- Tamper-proof
- Timestamped

---

## Authentication

### Password Requirements

**Minimum Requirements**:
- 12 characters minimum
- Mix of uppercase and lowercase
- At least one number
- At least one special character
- Not in common password list

**Best Practices**:
- Use password manager
- Unique password for Defense Catalyst
- Change if compromised
- Don't share passwords

### Multi-Factor Authentication (MFA)

**Supported Methods**:
- Authenticator app (TOTP)
- SMS (not recommended)
- Hardware security key (Enterprise)

**Setup**:
1. Go to Account Settings
2. Enable MFA
3. Scan QR code with authenticator app
4. Enter verification code
5. Save backup codes

**Recovery**:
- Use backup codes
- Contact support if locked out
- Verify identity required

### Single Sign-On (SSO)

**Available For**: Enterprise customers

**Supported Providers**:
- Google Workspace
- Microsoft Azure AD
- Okta
- Auth0
- Custom SAML 2.0

**Benefits**:
- Centralized access control
- Automatic provisioning/deprovisioning
- Compliance with corporate policies
- Reduced password fatigue

---

## Network Security

### IP Whitelisting

**Available For**: Enterprise customers

**What It Does**:
- Restricts access to specific IP addresses
- Blocks unauthorized access attempts
- Adds layer of security

**Use Cases**:
- Office network only
- VPN required
- Known locations only

### Firewall Rules

**Inbound**:
- HTTPS (443) only
- DDoS protection enabled
- Rate limiting active
- Geographic restrictions available

**Outbound**:
- Connections to external services
- Webhook deliveries
- API calls
- All encrypted

### TLS/SSL

**Configuration**:
- TLS 1.3 preferred
- TLS 1.2 minimum
- Strong cipher suites only
- HSTS enabled
- Certificate transparency

---

## Data Privacy

### What We Collect

**Account Data**:
- Email address
- Name
- Workspace information
- Usage statistics

**Flow Data**:
- Flow configurations
- Run history
- Input/output data
- Error logs

**Connection Data**:
- Connection names
- Encrypted credentials
- Usage metadata

### What We Don't Collect

- ❌ Passwords (stored hashed only)
- ❌ Connection credentials (stored encrypted, never viewed)
- ❌ Sensitive data from your flows (not analyzed)
- ❌ Personal information beyond account needs

### Data Sharing

**We Never**:
- Sell your data
- Share with third parties for marketing
- Use your data to train AI models
- Access your data without permission

**We May Share**:
- With your explicit consent
- To comply with legal requirements
- With service providers (under strict agreements)
- Anonymized, aggregated analytics

### Your Rights

**You Can**:
- Access your data
- Export your data
- Delete your data
- Correct inaccurate data
- Opt out of analytics
- Request data processing details

**How to Exercise Rights**:
- Contact: privacy@defensecatalyst.com
- Response time: 30 days
- Verification required

---

## Best Practices

### For Workspace Admins

**User Management**:
- ✅ Use principle of least privilege
- ✅ Assign appropriate roles
- ✅ Review access quarterly
- ✅ Remove inactive users
- ✅ Enable MFA for all users

**Connection Management**:
- ✅ Use service accounts for production
- ✅ Rotate credentials regularly
- ✅ Delete unused connections
- ✅ Audit connection usage
- ✅ Document connection purposes

**Monitoring**:
- ✅ Review audit logs monthly
- ✅ Monitor for suspicious activity
- ✅ Set up security alerts
- ✅ Track failed login attempts
- ✅ Review API usage

### For All Users

**Account Security**:
- ✅ Use strong, unique password
- ✅ Enable MFA
- ✅ Don't share credentials
- ✅ Log out on shared devices
- ✅ Report suspicious activity

**Flow Security**:
- ✅ Don't hardcode secrets in flows
- ✅ Use connections for credentials
- ✅ Validate external data
- ✅ Handle errors securely
- ✅ Test flows in non-production first

**Data Handling**:
- ✅ Minimize sensitive data in flows
- ✅ Sanitize logs
- ✅ Use encryption when possible
- ✅ Follow data retention policies
- ✅ Document data flows

### For Developers

**API Security**:
- ✅ Use API keys securely
- ✅ Rotate keys regularly
- ✅ Implement rate limiting
- ✅ Validate all inputs
- ✅ Handle errors gracefully

**Integration Security**:
- ✅ Use HTTPS for webhooks
- ✅ Verify webhook signatures
- ✅ Validate external data
- ✅ Implement timeouts
- ✅ Log security events

---

## Incident Response

### If You Suspect a Security Issue

**Immediate Actions**:
1. Change your password
2. Revoke suspicious connections
3. Review recent activity
4. Contact security team

**Report To**:
- Email: security@defensecatalyst.com
- Include: What you observed, when, affected resources
- Response time: 24 hours for security issues

### If Your Account Is Compromised

**Steps**:
1. Reset password immediately
2. Enable MFA if not already enabled
3. Review and revoke all connections
4. Check audit logs for unauthorized activity
5. Contact support
6. Rotate all external credentials

### Our Response

**We Will**:
- Investigate promptly
- Contain the issue
- Notify affected users
- Provide remediation steps
- Document and learn

**Timeline**:
- Initial response: 24 hours
- Investigation: 48-72 hours
- Resolution: Varies by severity
- Post-mortem: Within 1 week

---

## Compliance & Certifications

### Current Certifications

- SOC 2 Type II (in progress)
- GDPR compliant
- CCPA compliant
- DoD security requirements

### Compliance Documentation

**Available**:
- Security whitepaper
- Data processing agreement
- Business associate agreement (BAA)
- Compliance questionnaires

**Request**: Contact compliance@defensecatalyst.com

---

## Related Documentation

- [Privacy Policy](https://defensecatalyst.com/privacy) - Full privacy policy
- [Terms of Service](https://defensecatalyst.com/terms) - Terms and conditions
- [Acceptable Use Policy](https://defensecatalyst.com/aup) - Usage guidelines
- [Contact Support](contact-support.md) - Get help

---

## Security Contact

**For Security Issues**:
- Email: security@defensecatalyst.com
- PGP Key: [Available on request]
- Response time: 24 hours

**For Privacy Questions**:
- Email: privacy@defensecatalyst.com
- Response time: 30 days

**For Compliance**:
- Email: compliance@defensecatalyst.com
- Response time: 5 business days

---

## Quick Reference

### Security Checklist

**Account**:
- [ ] Strong password set
- [ ] MFA enabled
- [ ] Recovery codes saved
- [ ] Email verified

**Workspace**:
- [ ] Users have appropriate roles
- [ ] Inactive users removed
- [ ] Audit logs reviewed
- [ ] Security alerts configured

**Connections**:
- [ ] Using service accounts
- [ ] Credentials rotated regularly
- [ ] Unused connections deleted
- [ ] Connection usage documented

**Flows**:
- [ ] No hardcoded secrets
- [ ] Error handling implemented
- [ ] External data validated
- [ ] Tested before production


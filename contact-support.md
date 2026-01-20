# Contact Support

## Overview

Need help with Defense Catalyst? This page explains how to get support, what information to provide, and what to expect.

---

## Before Contacting Support

Save time by checking these resources first:

### Self-Service Resources

**Documentation**:
- [Troubleshooting Hub](troubleshooting-hub.md) - Common issues and solutions
- [Error Reference](error-reference.md) - Error codes and fixes
- [Integration Guides](integrations-directory.md) - Setup instructions
- [FAQ](faq.md) - Frequently asked questions

**Search**:
- Use search function in documentation
- Check changelog for recent changes
- Review integration-specific docs

**Community**:
- Community forum (if available)
- User discussions
- Shared solutions

---

## How to Contact Support

### Email Support

**General Support**:
- Email: help@defensecatalyst.com
- Response time: 24-48 hours (business days)
- For non-urgent issues

**Security Issues**:
- Email: security@defensecatalyst.com
- Response time: 24 hours
- For security concerns only

**Billing Questions**:
- Email: help@defensecatalyst.com
- Response time: 24-48 hours (business days)
- For account and billing issues

### Emergency Contact

**For Critical Issues Only**:
- Phone: [Emergency phone number]
- Available: 24/7 (Enterprise customers)
- Use for: Production outages, security incidents

**What Qualifies as Critical**:
- Complete service outage
- Data breach or security incident
- Critical business impact
- Affects multiple users

---

## What to Include in Your Request

### Required Information

#### **1. Workspace ID**

**Where to Find**:
1. Go to Settings
2. Click Workspace
3. Copy Workspace ID

**Format**: `ws_xxxxxxxxxxxxx`

**Why We Need It**: Identifies your account and environment

#### **2. Flow ID** (if applicable)

**Where to Find**:
1. Open the flow
2. Click Settings or Info
3. Copy Flow ID

**Format**: `flow_xxxxxxxxxxxxx`

**Why We Need It**: Identifies the specific workflow

#### **3. Run ID** (if applicable)

**Where to Find**:
1. Open run details
2. Look for Run ID at top
3. Copy Run ID

**Format**: `run_xxxxxxxxxxxxx`

**Why We Need It**: Identifies the specific execution

#### **4. Timestamp**

**What to Include**:
- Date and time of issue
- Include timezone
- Be as specific as possible

**Format**: `2026-01-18 14:30:00 UTC`

**Why We Need It**: Helps us find relevant logs

#### **5. Error Message**

**What to Include**:
- Exact error text
- Error code (if shown)
- Full error details
- Don't paraphrase

**Example**:
```
[CONNECTION_INVALID] Connection credentials are invalid or expired
OAuth token has expired. Please reconnect.
```

**Why We Need It**: Identifies the specific problem

### Helpful Information

#### **Screenshots**

**What to Capture**:
- Error messages
- Run details view
- Configuration screens
- Unexpected behavior

**How to Attach**:
- Use support portal for large files
- Attach to email (< 10 MB)
- Use image hosting for very large files

**Tips**:
- Capture full screen when possible
- Include relevant context
- Highlight important areas
- Multiple screenshots if needed

#### **Steps to Reproduce**

**Format**:
```
1. Go to flow builder
2. Add Slack action
3. Click "Connect"
4. Authorize with Slack
5. Error appears: [error message]
```

**Why It Helps**: Allows us to recreate the issue

#### **Expected vs Actual Behavior**

**Expected**:
```
Flow should send Slack message when webhook receives data
```

**Actual**:
```
Flow runs successfully but no Slack message appears
```

**Why It Helps**: Clarifies the problem

#### **Recent Changes**

**What to Mention**:
- Did you modify the flow recently?
- Did you update any connections?
- Did external service change?
- Did you change any settings?

**Example**:
```
I updated the Slack connection yesterday and the flow stopped working today
```

#### **Environment Details**

**For UI Issues**:
- Browser and version (Chrome 120, Firefox 121, etc.)
- Operating system (Windows 11, macOS 14, etc.)
- Screen resolution
- Any browser extensions

**For API Issues**:
- API client used
- Request/response details
- Headers sent
- Authentication method

---

## Support Request Template

### Copy and Fill Out

```
Subject: [Brief description of issue]

REQUIRED INFORMATION:
Workspace ID: ws_xxxxxxxxxxxxx
Flow ID: flow_xxxxxxxxxxxxx (if applicable)
Run ID: run_xxxxxxxxxxxxx (if applicable)
Timestamp: 2026-01-18 14:30:00 UTC

ERROR MESSAGE:
[Paste exact error message here]

DESCRIPTION:
[Detailed description of the problem]

STEPS TO REPRODUCE:
1. [First step]
2. [Second step]
3. [Third step]
4. [Error occurs]

EXPECTED BEHAVIOR:
[What should happen]

ACTUAL BEHAVIOR:
[What actually happens]

RECENT CHANGES:
[Any recent modifications]

TROUBLESHOOTING ATTEMPTED:
- [What you've tried]
- [Results of attempts]

ENVIRONMENT (if UI issue):
Browser: Chrome 120
OS: Windows 11
Screen: 1920x1080

ATTACHMENTS:
- Screenshot 1: [description]
- Screenshot 2: [description]
```

---

## Response Time Expectations

### Standard Support

**Initial Response**:
- Business hours: 4-8 hours
- After hours: Next business day
- Weekends: Next Monday

**Resolution Time**:
- Simple issues: 1-2 business days
- Complex issues: 3-5 business days
- Requires investigation: 5-10 business days

**Business Hours**:
- Monday-Friday
- 9 AM - 5 PM EST
- Excluding holidays

### Priority Support (Enterprise)

**Initial Response**:
- Critical: 1 hour
- High: 4 hours
- Medium: 8 hours
- Low: 24 hours

**Resolution Time**:
- Critical: 4 hours
- High: 1 business day
- Medium: 3 business days
- Low: 5 business days

**Availability**:
- 24/7 for critical issues
- Business hours for non-critical

---

## Escalation Process

### When to Escalate

**Escalate if**:
- No response within expected time
- Issue is more urgent than initially thought
- Problem is getting worse
- Multiple users affected
- Business-critical impact

### How to Escalate

**Step 1**: Reply to existing ticket
- Mark as urgent
- Explain increased severity
- Provide business impact

**Step 2**: Contact escalation email
- Email: escalations@defensecatalyst.com
- Include original ticket number
- Explain why escalating

**Step 3**: Emergency contact (Enterprise only)
- Call emergency number
- Reference ticket number
- Explain critical impact

---

## Issue Priority Levels

### Critical (P1)

**Definition**:
- Complete service outage
- Security breach
- Data loss
- Affects all users

**Response**: 1 hour (Enterprise), 4 hours (Standard)

**Examples**:
- Platform is down
- Data breach detected
- Cannot access any flows
- All runs failing

### High (P2)

**Definition**:
- Major feature not working
- Affects multiple users
- Significant business impact
- Workaround not available

**Response**: 4 hours (Enterprise), 8 hours (Standard)

**Examples**:
- Integration completely broken
- Cannot create new flows
- All runs for specific flow failing
- Connection system not working

### Medium (P3)

**Definition**:
- Feature partially working
- Affects single user
- Workaround available
- Moderate business impact

**Response**: 8 hours (Enterprise), 24 hours (Standard)

**Examples**:
- Specific action failing
- UI rendering issue
- Performance degradation
- Non-critical feature broken

### Low (P4)

**Definition**:
- Minor issue
- Cosmetic problem
- Feature request
- Question

**Response**: 24 hours (Enterprise), 48 hours (Standard)

**Examples**:
- Typo in UI
- Feature enhancement request
- Documentation question
- How-to question

---

## What to Expect

### Support Process

**1. Ticket Created**:
- Automatic confirmation email
- Ticket number assigned
- Initial response time estimate

**2. Initial Response**:
- Support agent reviews issue
- May ask clarifying questions
- Provides initial assessment

**3. Investigation**:
- Agent investigates problem
- May request additional information
- Keeps you updated on progress

**4. Resolution**:
- Solution provided
- Verification requested
- Ticket closed when confirmed

**5. Follow-up**:
- Satisfaction survey
- Feedback opportunity
- Documentation updated if needed

### Communication

**How We'll Contact You**:
- Email to address on ticket
- Updates in support portal
- Phone (for critical issues)

**What We'll Provide**:
- Regular status updates
- Clear explanations
- Step-by-step solutions
- Documentation links

**What We Need from You**:
- Timely responses to questions
- Testing of proposed solutions
- Confirmation when resolved
- Feedback on experience

---

## Common Support Scenarios

### "My flow isn't working"

**We'll Need**:
- Flow ID
- Run ID of failed execution
- Error message
- Recent changes

**We'll Check**:
- Flow configuration
- Connection status
- Run logs
- External service status

### "I can't connect to [service]"

**We'll Need**:
- Which service
- Error message
- Connection attempt timestamp
- Account type (free/paid)

**We'll Check**:
- Connection configuration
- OAuth flow
- API status
- Known issues

### "My data isn't mapping correctly"

**We'll Need**:
- Flow ID
- Run ID showing issue
- Expected vs actual data
- Screenshots of mapping

**We'll Check**:
- Data structure
- Mapping configuration
- Previous step output
- Data transformations

### "I'm getting rate limited"

**We'll Need**:
- Which service
- Flow execution frequency
- Error message
- Run IDs

**We'll Check**:
- Rate limit details
- Usage patterns
- Optimization opportunities
- Plan limits

---

## Feedback

### After Your Issue Is Resolved

**Survey**:
- Short satisfaction survey
- Rate your experience
- Provide feedback
- Suggest improvements

**Your Feedback Helps**:
- Improve support quality
- Identify documentation gaps
- Enhance product
- Train support team

---

## Additional Resources

### Knowledge Base

**Access**: [help.defensecatalyst.com]

**Contents**:
- How-to articles
- Video tutorials
- Best practices
- Common solutions

### Community Forum

**Access**: [community.defensecatalyst.com]

**Features**:
- Ask questions
- Share solutions
- Connect with users
- Vote on features

### Status Page

**Access**: [status.defensecatalyst.com]

**Information**:
- Current system status
- Scheduled maintenance
- Incident history
- Subscribe to updates

---

## Contact Information Summary

| Type | Contact | Response Time |
|------|---------|---------------|
| General Support | support@defensecatalyst.com | 24-48 hours |
| Security Issues | security@defensecatalyst.com | 24 hours |
| Billing | billing@defensecatalyst.com | 24-48 hours |
| Emergency (Enterprise) | [Phone number] | 1 hour |
| Escalations | escalations@defensecatalyst.com | 4 hours |

---

## Related Documentation

- [Troubleshooting Hub](troubleshooting-hub.md) - Self-service solutions
- [Error Reference](error-reference.md) - Error codes
- [FAQ](faq.md) - Common questions
- [Getting Started](getting-started.md) - Basic help

---

**We're here to help!** Don't hesitate to reach out if you need assistance.


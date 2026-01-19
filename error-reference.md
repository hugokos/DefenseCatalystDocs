# Error Reference

## How to Use This Reference

This page lists common error codes and messages you might encounter in Defense Catalyst. Each entry includes:

- **Error code/message**: What you see
- **What it means**: Plain language explanation
- **Common causes**: Why it happens
- **Fix steps**: How to resolve it
- **Related docs**: Where to learn more

**Can't find your error?** Check the [Troubleshooting Hub](07-troubleshooting-hub.md) or [Contact Support](13-contact-support.md).

---

## Error Format

Errors in Defense Catalyst typically follow this format:

```
[ERROR_CODE] Error Message
Additional details about the error
```

Example:
```
[TRIGGER_FAILED] Webhook trigger execution failed
Invalid JSON payload received
```

---

## Trigger Errors

### TRIGGER_FAILED
**What it means**: The trigger couldn't execute properly

**Common causes**:
1. Invalid trigger configuration
2. Connection expired or invalid
3. External service unavailable
4. Invalid data received

**Fix steps**:
1. Check trigger configuration
2. Verify connection is active
3. Test trigger manually
4. Check external service status
5. Review trigger logs for details

**Related**: [Troubleshooting: Workflow Won't Trigger](07-troubleshooting-hub.md#my-workflow-wont-trigger)

---

### WEBHOOK_INVALID_PAYLOAD
**What it means**: Webhook received data in wrong format

**Common causes**:
1. Invalid JSON syntax
2. Missing required fields
3. Wrong Content-Type header
4. Malformed data

**Fix steps**:
1. Check webhook payload format
2. Verify JSON is valid
3. Ensure Content-Type is `application/json`
4. Test with valid sample data
5. Check source system configuration

**Related**: [Webhook Integration](06-integration-webhook.md)

---

### WEBHOOK_SIGNATURE_INVALID
**What it means**: Webhook signature verification failed

**Common causes**:
1. Wrong webhook secret
2. Signature algorithm mismatch
3. Payload modified in transit
4. Encoding issues

**Fix steps**:
1. Verify webhook secret is correct
2. Check signature algorithm matches
3. Ensure payload isn't modified
4. Review source system documentation
5. Test with known good signature

**Related**: [Troubleshooting: Webhook Signature Errors](07-troubleshooting-hub.md#webhook-signature--401-errors)

---

### SCHEDULE_INVALID_CRON
**What it means**: Cron expression is invalid

**Common causes**:
1. Syntax error in cron expression
2. Missing parts (needs 5 parts)
3. Invalid values in ranges
4. Unsupported cron features

**Fix steps**:
1. Validate cron expression at [crontab.guru](https://crontab.guru)
2. Ensure 5 parts: minute hour day month weekday
3. Check ranges are valid (0-59 for minutes, etc.)
4. Use standard cron syntax
5. Test with simple expression first

**Related**: [Schedule Integration](06-integration-schedule.md)

---

## Action Errors

### ACTION_FAILED
**What it means**: An action step couldn't complete

**Common causes**:
1. Invalid action configuration
2. Missing required fields
3. Connection expired
4. External service error
5. Invalid input data

**Fix steps**:
1. Check action configuration
2. Verify all required fields have values
3. Test connection
4. Review input data
5. Check external service status
6. Review action logs for details

**Related**: [Troubleshooting: Run Failed](07-troubleshooting-hub.md#my-run-failed)

---

### ACTION_TIMEOUT
**What it means**: Action took too long to complete

**Common causes**:
1. External service is slow
2. Large data payload
3. Network issues
4. Service overload

**Fix steps**:
1. Check external service status
2. Reduce data size if possible
3. Increase timeout setting (if available)
4. Try during off-peak hours
5. Optimize request
6. Contact service provider

**Related**: [Troubleshooting: Timeouts](07-troubleshooting-hub.md#rate-limits--timeouts)

---

## Connection Errors

### CONNECTION_INVALID
**What it means**: Connection credentials are invalid or expired

**Common causes**:
1. OAuth token expired
2. API key revoked
3. Password changed
4. Permissions revoked
5. Account suspended

**Fix steps**:
1. Go to Connections page
2. Find the connection
3. Click "Reconnect"
4. Re-authorize with service
5. Verify credentials are current
6. Check account status

**Related**: [Troubleshooting: Connection Problems](07-troubleshooting-hub.md#connectionauth-problems)

---

### CONNECTION_UNAUTHORIZED
**What it means**: Authentication failed

**Common causes**:
1. Wrong username/password
2. Invalid API key
3. Token expired
4. Insufficient permissions

**Fix steps**:
1. Verify credentials are correct
2. Generate new API key if needed
3. Reconnect with correct credentials
4. Check required permissions
5. Verify account is active

**Related**: [Core Concepts: Connections](04-core-concepts.md#connections--authentication)

---

### CONNECTION_FORBIDDEN
**What it means**: Access denied despite valid authentication

**Common causes**:
1. Insufficient permissions
2. Resource-level restrictions
3. Account type limitations
4. IP restrictions

**Fix steps**:
1. Check required permissions for action
2. Verify account has access to resource
3. Request additional permissions
4. Check IP whitelist settings
5. Upgrade account if needed

**Related**: [Security & Privacy](11-security-privacy.md)

---

## Rate Limit Errors

### RATE_LIMIT_EXCEEDED
**What it means**: Too many requests to external service

**Common causes**:
1. Flow runs too frequently
2. Too many API calls per run
3. Burst of traffic
4. Shared rate limit exhausted

**Fix steps**:
1. Reduce flow execution frequency
2. Add delays between requests
3. Implement exponential backoff
4. Batch operations
5. Upgrade service plan
6. Wait for rate limit reset

**Related**: [Troubleshooting: Rate Limits](07-troubleshooting-hub.md#rate-limits--timeouts)

---

### QUOTA_EXCEEDED
**What it means**: Usage quota limit reached

**Common causes**:
1. Monthly/daily limit reached
2. Credit balance depleted
3. Plan limits exceeded

**Fix steps**:
1. Check usage dashboard
2. Upgrade plan if needed
3. Add credits to account
4. Wait for quota reset
5. Optimize usage

**Related**: [Limits & Reliability](10-limits-reliability.md)

---

## Data Errors

### INVALID_INPUT
**What it means**: Input data format is invalid

**Common causes**:
1. Wrong data type
2. Missing required fields
3. Invalid JSON
4. Out of range values
5. Malformed data

**Fix steps**:
1. Check input data format
2. Verify required fields present
3. Validate JSON syntax
4. Check data types match expectations
5. Use data transformation if needed
6. Add validation step

**Related**: [Troubleshooting: Data Mapping](07-troubleshooting-hub.md#my-data-mapping-is-emptywrong)

---

### DATA_MAPPING_ERROR
**What it means**: Couldn't map data from previous step

**Common causes**:
1. Previous step failed
2. Wrong data path
3. Data structure mismatch
4. Null/undefined values

**Fix steps**:
1. Verify previous step succeeded
2. Check data path is correct
3. Use data picker to select fields
4. Add default values
5. Use conditions to handle missing data

**Related**: [Core Concepts: Data Mapping](04-core-concepts.md#data-mapping)

---

### JSON_PARSE_ERROR
**What it means**: Couldn't parse JSON data

**Common causes**:
1. Invalid JSON syntax
2. Unescaped special characters
3. Trailing commas
4. Single quotes instead of double

**Fix steps**:
1. Validate JSON at [jsonlint.com](https://jsonlint.com)
2. Check for syntax errors
3. Escape special characters
4. Use double quotes for strings
5. Remove trailing commas

**Related**: [Data Mapping](04-core-concepts.md#data-mapping)

---

## Network Errors

### NETWORK_ERROR
**What it means**: Network connectivity issue

**Common causes**:
1. Internet connection lost
2. DNS resolution failed
3. Firewall blocking request
4. Service unavailable

**Fix steps**:
1. Check internet connectivity
2. Verify service is accessible
3. Check firewall rules
4. Try again later
5. Contact network admin if persistent

**Related**: [Troubleshooting Hub](07-troubleshooting-hub.md)

---

### DNS_RESOLUTION_FAILED
**What it means**: Couldn't resolve domain name

**Common causes**:
1. Invalid domain name
2. DNS server issues
3. Domain doesn't exist
4. Network configuration

**Fix steps**:
1. Verify domain name is correct
2. Check domain exists
3. Try different DNS server
4. Check network settings

---

### SSL_CERTIFICATE_ERROR
**What it means**: SSL/TLS certificate validation failed

**Common causes**:
1. Expired certificate
2. Self-signed certificate
3. Certificate mismatch
4. Untrusted CA

**Fix steps**:
1. Check certificate is valid
2. Verify domain matches certificate
3. Update certificate if expired
4. Use trusted certificate authority

**Related**: [Security & Privacy](11-security-privacy.md)

---

## Permission Errors

### PERMISSION_DENIED
**What it means**: Insufficient permissions for operation

**Common causes**:
1. Missing OAuth scopes
2. Account role limitations
3. Resource-level restrictions
4. Feature not available in plan

**Fix steps**:
1. Check required permissions
2. Reconnect with broader scopes
3. Request access from admin
4. Verify account type
5. Upgrade plan if needed

**Related**: [Troubleshooting: Connection Problems](07-troubleshooting-hub.md#connectionauth-problems)

---

### INSUFFICIENT_SCOPE
**What it means**: OAuth token missing required scopes

**Common causes**:
1. Connected with limited permissions
2. Scopes changed after connection
3. Action requires additional scope

**Fix steps**:
1. Go to Connections
2. Reconnect integration
3. Grant all requested permissions
4. Verify scopes in OAuth flow

**Related**: [Core Concepts: Connections](04-core-concepts.md#connections--authentication)

---

## Validation Errors

### VALIDATION_FAILED
**What it means**: Data failed validation rules

**Common causes**:
1. Required field missing
2. Invalid format (email, phone, etc.)
3. Value out of range
4. Duplicate value

**Fix steps**:
1. Check validation error details
2. Provide all required fields
3. Verify data format
4. Check value constraints
5. Fix invalid data

**Related**: [Data Mapping](04-core-concepts.md#data-mapping)

---

### REQUIRED_FIELD_MISSING
**What it means**: Required field has no value

**Common causes**:
1. Field not mapped
2. Previous step returned null
3. Data path incorrect

**Fix steps**:
1. Map data to required field
2. Add default value
3. Check previous step output
4. Verify data path

**Related**: [Troubleshooting: Data Mapping](07-troubleshooting-hub.md#my-data-mapping-is-emptywrong)

---

## Service-Specific Errors

### GOOGLE_SHEETS_ERROR
**What it means**: Google Sheets API error

**Common causes**:
1. Spreadsheet not found
2. Worksheet doesn't exist
3. Permission denied
4. Invalid range

**Fix steps**:
1. Verify spreadsheet exists
2. Check worksheet name
3. Verify edit access
4. Check range is valid
5. Reconnect Google Sheets

**Related**: [Google Sheets Integration](06-integration-google-sheets.md)

---

### SLACK_API_ERROR
**What it means**: Slack API returned error

**Common causes**:
1. Invalid channel
2. Bot not in channel
3. Permission denied
4. Rate limit exceeded

**Fix steps**:
1. Verify channel exists
2. Invite bot to channel
3. Check bot permissions
4. Reduce message frequency

**Related**: [Slack Integration](06-integration-slack.md)

---

### OPENAI_API_ERROR
**What it means**: OpenAI API error

**Common causes**:
1. Invalid API key
2. Insufficient quota
3. Rate limit exceeded
4. Context length exceeded
5. Content policy violation

**Fix steps**:
1. Verify API key
2. Check OpenAI billing
3. Reduce request frequency
4. Shorten prompt
5. Review content policy

**Related**: [OpenAI Integration](06-integration-openai.md)

---

### GITHUB_API_ERROR
**What it means**: GitHub API error

**Common causes**:
1. Repository not found
2. Resource not accessible
3. Validation failed
4. Rate limit exceeded

**Fix steps**:
1. Verify repository name
2. Check permissions
3. Validate input data
4. Reduce API calls

**Related**: [GitHub Integration](06-integration-github.md)

---

## Flow Execution Errors

### FLOW_EXECUTION_FAILED
**What it means**: Flow couldn't complete execution

**Common causes**:
1. Step failed
2. Timeout exceeded
3. Resource limit reached
4. System error

**Fix steps**:
1. Check run details
2. Identify failed step
3. Fix step configuration
4. Retry execution

**Related**: [Runs & Debugging](09-runs-logs-debugging.md)

---

### FLOW_DISABLED
**What it means**: Attempted to run disabled flow

**Common causes**:
1. Flow manually disabled
2. Auto-disabled after errors
3. Plan limit reached

**Fix steps**:
1. Enable flow
2. Check error history
3. Fix underlying issues
4. Verify plan limits

**Related**: [Troubleshooting: Workflow Won't Trigger](07-troubleshooting-hub.md#my-workflow-wont-trigger)

---

### FLOW_NOT_PUBLISHED
**What it means**: Flow is in draft mode

**Common causes**:
1. Flow never published
2. Unpublished after edit
3. Reverted to draft

**Fix steps**:
1. Open flow editor
2. Click "Publish"
3. Verify flow status

**Related**: [Getting Started](02-getting-started.md)

---

## System Errors

### INTERNAL_SERVER_ERROR
**What it means**: Unexpected system error

**Common causes**:
1. System bug
2. Resource exhaustion
3. Database error
4. Service disruption

**Fix steps**:
1. Retry operation
2. Check system status
3. Wait a few minutes
4. Contact support if persistent

**Related**: [Contact Support](13-contact-support.md)

---

### SERVICE_UNAVAILABLE
**What it means**: Service temporarily unavailable

**Common causes**:
1. Maintenance window
2. System overload
3. Deployment in progress

**Fix steps**:
1. Wait a few minutes
2. Check status page
3. Retry operation
4. Contact support if extended

**Related**: [Limits & Reliability](10-limits-reliability.md)

---

## Getting Help

### Error Not Listed?

1. Check [Troubleshooting Hub](07-troubleshooting-hub.md) for symptom-based help
2. Search [FAQ](15-faq.md) for common questions
3. Review integration-specific documentation
4. [Contact Support](13-contact-support.md) with error details

### When Contacting Support

Include:
- **Error code/message**: Exact text
- **Workspace ID**: Your workspace identifier
- **Flow ID**: Affected flow
- **Run ID**: Failed run (if applicable)
- **Timestamp**: When error occurred
- **Steps to reproduce**: How to trigger error
- **Screenshots**: Visual context

**Template**:
```
Error: [ERROR_CODE] Error Message
Workspace: ws_xxxxx
Flow: flow_xxxxx
Run: run_xxxxx
Timestamp: 2025-01-18 14:30:00 UTC

Description:
[What you were trying to do]

Steps to Reproduce:
1. [Step 1]
2. [Step 2]
3. [Error occurs]

Expected: [What should happen]
Actual: [What actually happened]
```

---

## Related Documentation

- [Troubleshooting Hub](07-troubleshooting-hub.md) - Symptom-based troubleshooting
- [Runs & Debugging](09-runs-logs-debugging.md) - Debug failed runs
- [Limits & Reliability](10-limits-reliability.md) - Platform limits
- [Contact Support](13-contact-support.md) - Get help

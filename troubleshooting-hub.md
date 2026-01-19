# Troubleshooting Hub

## How to Use This Guide

1. **Find your symptom** in the list below
2. **Follow diagnosis steps** to identify the cause
3. **Apply the resolution** that matches your situation
4. **Implement prevention** to avoid future issues
5. **Check related articles** for more information

If you can't find your issue here, check the [Error Reference](08-error-reference.md) or [Contact Support](13-contact-support.md).

---

## Quick Links

- [My Workflow Won't Trigger](#my-workflow-wont-trigger)
- [My Run Failed](#my-run-failed)
- [My Data Mapping is Empty/Wrong](#my-data-mapping-is-emptywrong)
- [Connection/Auth Problems](#connectionauth-problems)
- [Rate Limits / Timeouts](#rate-limits--timeouts)
- [Webhook Signature / 401 Errors](#webhook-signature--401-errors)
- [Flow Runs But Doesn't Do What I Expected](#flow-runs-but-doesnt-do-what-i-expected)
- [Performance Issues](#performance-issues)

---

## My Workflow Won't Trigger

### Symptoms
- Flow never runs automatically
- No runs appear in history
- Trigger seems inactive
- Expected events don't start flow

### Environment Check
1. Is the flow **published** (not in draft mode)?
2. Is the flow **enabled** (toggle is ON)?
3. Check the flow status indicator

### Diagnosis by Trigger Type

#### **Webhook Trigger**
1. **Check webhook URL is correct**
   - Copy URL from trigger configuration
   - Verify it matches what's configured in source system
   - Check for typos or extra characters

2. **Test webhook manually**
   - Use tool like Postman or curl
   - Send test request to webhook URL
   - Check if run appears in history

3. **Verify request format**
   - Check Content-Type header (usually `application/json`)
   - Verify request body format matches expectations
   - Check for required headers

4. **Check source system configuration**
   - Verify webhook is enabled in source
   - Check webhook hasn't been deleted
   - Verify URL hasn't changed

#### **Schedule Trigger**
1. **Verify cron expression is valid**
   - Use [crontab.guru](https://crontab.guru) to validate
   - Check all 5 parts are present
   - Verify syntax is correct

2. **Check "Next Run" time**
   - Should show future timestamp
   - If in past, schedule may be invalid
   - If blank, schedule is not configured

3. **Consider timezone**
   - Schedules run in UTC
   - Convert local time to UTC
   - Account for daylight saving time

4. **Wait for next scheduled time**
   - Schedules don't run immediately
   - First run occurs at next scheduled time
   - Check run history after scheduled time passes

#### **App Event Trigger** (Slack, GitHub, etc.)
1. **Verify connection is active**
   - Go to Connections page
   - Check connection status
   - Reconnect if expired

2. **Check app permissions**
   - Verify app has necessary scopes
   - Check you have access to monitored resource
   - Verify app installation is active

3. **Test event manually**
   - Trigger event manually in app
   - Check if flow runs
   - Review run logs for errors

4. **Check polling interval**
   - Some triggers use polling (not real-time)
   - Minimum interval is typically 5 minutes
   - Wait for next poll cycle

### Resolution Steps

**For Draft Flows**:
1. Click "Publish" button
2. Confirm publication
3. Verify flow status changes to "Published"

**For Disabled Flows**:
1. Find enable/disable toggle
2. Switch to enabled (ON)
3. Verify status indicator shows active

**For Invalid Configuration**:
1. Review trigger configuration
2. Fix any validation errors
3. Save changes
4. Test trigger

**For Connection Issues**:
1. Go to Connections
2. Find relevant connection
3. Click "Reconnect"
4. Re-authorize if needed

### Prevention

- ✅ Always publish flows after editing
- ✅ Test triggers before relying on them
- ✅ Monitor run history regularly
- ✅ Set up alerts for missing runs
- ✅ Document trigger configuration
- ✅ Keep connections active and updated

### Related Articles
- [Core Concepts: Triggers](04-core-concepts.md#triggers-vs-actions)
- [Webhook Integration](06-integration-webhook.md)
- [Schedule Integration](06-integration-schedule.md)
- [Error Reference](08-error-reference.md)

---

## My Run Failed

### Symptoms
- Run shows "Failed" status
- Red error indicator
- Workflow stopped mid-execution
- Error message in run details

### Environment Check
1. Which step failed? (Check run details)
2. What's the error message?
3. Did previous steps succeed?
4. Is this a new failure or recurring?

### Diagnosis Steps

#### **Step 1: Identify the Failing Step**
1. Open run details
2. Find step with error icon
3. Note step name and type
4. Check if it's trigger or action

#### **Step 2: Read the Error Message**
1. Click on failed step
2. Read full error message
3. Look for error code (if present)
4. Note any specific details

#### **Step 3: Check Input Data**
1. Expand failed step
2. Review "Input" section
3. Check if required fields have values
4. Verify data format is correct

#### **Step 4: Verify Configuration**
1. Check step configuration
2. Verify all required fields filled
3. Check connection is active
4. Verify permissions are sufficient

### Common Failure Causes

#### **Missing or Invalid Data**
**Symptoms**: "Required field missing", "Invalid format"
**Fix**:
1. Check previous step completed successfully
2. Verify data mapping is correct
3. Add default values for optional fields
4. Use conditions to handle missing data

#### **Connection Expired**
**Symptoms**: "Authentication failed", "Invalid credentials"
**Fix**:
1. Go to Connections
2. Find connection used by failed step
3. Click "Reconnect"
4. Re-authorize with service

#### **Permission Denied**
**Symptoms**: "Insufficient permissions", "Access denied"
**Fix**:
1. Check account has necessary permissions
2. Verify OAuth scopes are sufficient
3. Check resource-level permissions
4. Contact admin if needed

#### **Rate Limit Exceeded**
**Symptoms**: "Rate limit exceeded", "Too many requests"
**Fix**:
1. Reduce flow execution frequency
2. Add delays between API calls
3. Implement retry logic
4. Check provider's rate limits

#### **Timeout**
**Symptoms**: "Request timeout", "Operation timed out"
**Fix**:
1. Check external service is responding
2. Increase timeout setting (if available)
3. Optimize request (reduce data size)
4. Try again during off-peak hours

#### **Invalid Input Format**
**Symptoms**: "Invalid JSON", "Parse error", "Format error"
**Fix**:
1. Check data format matches expected
2. Validate JSON structure
3. Escape special characters
4. Use data transformation if needed

### Resolution Steps

**For Temporary Errors**:
1. Click "Retry" button on failed run
2. Wait a moment and try again
3. Check if issue was temporary

**For Configuration Errors**:
1. Edit flow
2. Fix configuration issue
3. Save changes
4. Test flow again

**For Data Errors**:
1. Edit flow
2. Fix data mapping
3. Add validation or conditions
4. Test with sample data

**For Connection Errors**:
1. Reconnect integration
2. Verify permissions
3. Test connection
4. Retry run

### Prevention

- ✅ Test flows thoroughly before publishing
- ✅ Use error handling and conditions
- ✅ Monitor connection health
- ✅ Set up retry logic for temporary failures
- ✅ Validate data before using it
- ✅ Keep connections updated

### Related Articles
- [Runs & Debugging Guide](09-runs-logs-debugging.md)
- [Error Reference](08-error-reference.md)
- [Connection Management](04-core-concepts.md#connections--authentication)

---

## My Data Mapping is Empty/Wrong

### Symptoms
- Variables show as empty in output
- Wrong data appears in fields
- "undefined" or "null" values
- Data from wrong step

### Environment Check
1. Did previous step complete successfully?
2. Is data structure what you expected?
3. Are you referencing correct step?
4. Is data type compatible?

### Diagnosis Steps

#### **Step 1: Check Previous Step Output**
1. Open run details
2. Find previous step
3. Expand "Output" section
4. Verify data exists and has expected structure

#### **Step 2: Verify Data Path**
1. Check variable reference (e.g., `{{step1.data.email}}`)
2. Verify step name is correct
3. Check property path matches output structure
4. Look for typos in property names

#### **Step 3: Check Data Type**
1. Is data a string, number, object, or array?
2. Does target field expect different type?
3. Is conversion needed?

#### **Step 4: Test with Sample Data**
1. Use "Test" button
2. Check if sample data works
3. Compare sample vs real data structure

### Common Data Mapping Issues

#### **Null or Undefined Values**
**Cause**: Data doesn't exist or step failed
**Fix**:
1. Check previous step succeeded
2. Verify property path is correct
3. Add default value: `{{step1.email || 'no-email@example.com'}}`
4. Use condition to check if data exists

#### **Wrong Data Structure**
**Cause**: Expected object but got array (or vice versa)
**Fix**:
1. Inspect actual output structure
2. Adjust data path accordingly
3. Use array index if needed: `{{step1.items[0].name}}`
4. Transform data if necessary

#### **Data from Wrong Step**
**Cause**: Referenced wrong step name
**Fix**:
1. Check step names in flow
2. Update variable reference
3. Use data picker to select correct step

#### **Special Characters**
**Cause**: Data contains quotes, newlines, etc.
**Fix**:
1. Escape special characters
2. Use JSON.stringify if needed
3. Clean data before using

#### **Array vs Single Value**
**Cause**: Expected single value but got array
**Fix**:
1. Access first item: `{{step1.results[0]}}`
2. Or loop through array (if supported)
3. Or join array: `{{step1.items.join(', ')}}`

#### **Nested Data**
**Cause**: Data is deeply nested
**Fix**:
1. Use correct path: `{{step1.data.user.profile.email}}`
2. Check each level exists
3. Use optional chaining if available

### Resolution Steps

**For Missing Data**:
1. Verify previous step output
2. Fix data path
3. Add default values
4. Test again

**For Wrong Data Type**:
1. Transform data to correct type
2. Use conversion functions
3. Add validation step

**For Complex Structures**:
1. Use data picker tool
2. Test with sample data
3. Simplify data structure if possible

### Prevention

- ✅ Always test with real data
- ✅ Use data picker instead of typing paths
- ✅ Add default values for optional data
- ✅ Validate data structure before using
- ✅ Document expected data format
- ✅ Use conditions to handle edge cases

### Related Articles
- [Core Concepts: Data Mapping](04-core-concepts.md#data-mapping)
- [Runs & Debugging](09-runs-logs-debugging.md)
- [First Workflow Tutorial](03-first-workflow-tutorial.md)

---

## Connection/Auth Problems

### Symptoms
- "Authentication failed"
- "Invalid credentials"
- "Token expired"
- "Permission denied"
- Can't connect to service

### Environment Check
1. Is connection still listed in Connections page?
2. What's the connection status?
3. When was it last used successfully?
4. Has anything changed (password, permissions)?

### Diagnosis Steps

#### **Step 1: Check Connection Status**
1. Go to Connections page
2. Find relevant connection
3. Check status indicator
4. Note any error messages

#### **Step 2: Verify Credentials**
1. Check username/email is correct
2. Verify password hasn't changed
3. For API keys, check key is still valid
4. Check key hasn't been revoked

#### **Step 3: Check Permissions**
1. Verify account has necessary permissions
2. Check OAuth scopes are sufficient
3. Verify admin hasn't revoked access
4. Check service-level permissions

#### **Step 4: Test Connection**
1. Try reconnecting
2. Test with simple action
3. Check service status page

### Common Connection Issues

#### **Expired OAuth Token**
**Symptoms**: "Invalid grant", "Token expired"
**Fix**:
1. Go to Connections
2. Click "Reconnect"
3. Re-authorize with service
4. Verify new token works

#### **Invalid API Key**
**Symptoms**: "Invalid API key", "Unauthorized"
**Fix**:
1. Generate new API key in service
2. Update connection with new key
3. Delete old key if compromised
4. Test connection

#### **Insufficient Permissions**
**Symptoms**: "Permission denied", "Insufficient scope"
**Fix**:
1. Check required permissions for action
2. Reconnect with broader scopes
3. Contact admin for access
4. Verify account type supports feature

#### **Account Locked or Suspended**
**Symptoms**: "Account suspended", "Access denied"
**Fix**:
1. Check service account status
2. Resolve any account issues
3. Contact service support
4. Reconnect after resolution

#### **2FA/MFA Issues**
**Symptoms**: Can't complete OAuth flow
**Fix**:
1. Complete 2FA challenge
2. Use app password (for Gmail, etc.)
3. Whitelist Defense Catalyst
4. Check 2FA settings

#### **Service Outage**
**Symptoms**: Connection fails intermittently
**Fix**:
1. Check service status page
2. Wait for service recovery
3. Implement retry logic
4. Monitor service status

### Resolution Steps

**For Expired Tokens**:
1. Go to Connections
2. Find connection
3. Click "Reconnect"
4. Complete authorization
5. Test connection

**For Invalid Credentials**:
1. Verify credentials are correct
2. Reset password if needed
3. Generate new API key
4. Update connection
5. Test connection

**For Permission Issues**:
1. Check required permissions
2. Request additional access
3. Reconnect with correct scopes
4. Verify account type

**For Service Issues**:
1. Check service status
2. Wait for resolution
3. Contact service support
4. Implement fallback

### Prevention

- ✅ Monitor connection health regularly
- ✅ Set up alerts for connection failures
- ✅ Rotate API keys periodically
- ✅ Document required permissions
- ✅ Use service accounts for production
- ✅ Keep credentials secure

### Related Articles
- [Core Concepts: Connections](04-core-concepts.md#connections--authentication)
- [Security & Privacy](11-security-privacy.md)
- [Error Reference](08-error-reference.md)

---

## Rate Limits / Timeouts

### Symptoms
- "Rate limit exceeded"
- "Too many requests"
- "Request timeout"
- "Operation timed out"
- Slow performance

### Environment Check
1. How frequently is flow running?
2. How many API calls per run?
3. What's the provider's rate limit?
4. Is this a new issue or ongoing?

### Diagnosis Steps

#### **Step 1: Identify Rate Limit**
1. Check error message for limit details
2. Review provider's documentation
3. Check current usage
4. Note limit period (per minute, hour, day)

#### **Step 2: Calculate Request Rate**
1. Count API calls in flow
2. Multiply by execution frequency
3. Compare to provider limit
4. Identify bottleneck

#### **Step 3: Check Timeout Settings**
1. Note which step timed out
2. Check step timeout setting
3. Verify external service response time
4. Check network connectivity

### Common Rate Limit Issues

#### **Too Frequent Execution**
**Symptoms**: Hitting hourly/daily limits
**Fix**:
1. Reduce schedule frequency
2. Batch operations
3. Implement queuing
4. Upgrade service plan

#### **Too Many Calls Per Run**
**Symptoms**: Single run hits limit
**Fix**:
1. Optimize flow logic
2. Reduce unnecessary calls
3. Cache results
4. Batch API requests

#### **Burst Traffic**
**Symptoms**: Sudden spike in requests
**Fix**:
1. Implement rate limiting in flow
2. Add delays between requests
3. Use exponential backoff
4. Queue requests

#### **Slow External Service**
**Symptoms**: Requests timing out
**Fix**:
1. Increase timeout setting
2. Optimize request (reduce payload)
3. Use async processing
4. Contact service provider

### Resolution Steps

**For Rate Limits**:
1. Implement exponential backoff
2. Add delays between requests
3. Reduce execution frequency
4. Batch operations
5. Upgrade service plan

**For Timeouts**:
1. Increase timeout setting
2. Optimize request
3. Check service status
4. Implement retry logic
5. Use async processing

### Rate Limiting Strategies

#### **Exponential Backoff**
```
Attempt 1: Immediate
Attempt 2: Wait 1 second
Attempt 3: Wait 2 seconds
Attempt 4: Wait 4 seconds
Attempt 5: Wait 8 seconds
```

#### **Request Throttling**
```
Add delay between requests:
- 100ms for high-limit APIs
- 1s for medium-limit APIs
- 5s for low-limit APIs
```

#### **Batch Processing**
```
Instead of:
- 100 individual requests

Do:
- 1 batch request with 100 items
```

#### **Caching**
```
Cache results for:
- Static data: 24 hours
- Semi-static: 1 hour
- Dynamic: 5 minutes
```

### Prevention

- ✅ Know provider rate limits
- ✅ Monitor API usage
- ✅ Implement retry logic
- ✅ Use caching when possible
- ✅ Batch operations
- ✅ Set appropriate timeouts

### Related Articles
- [Limits & Reliability](10-limits-reliability.md)
- [Error Reference](08-error-reference.md)
- [Performance Best Practices](#performance-issues)

---

## Webhook Signature / 401 Errors

### Symptoms
- Webhook trigger fails
- "401 Unauthorized"
- "Invalid signature"
- "Signature verification failed"
- Webhook receives request but doesn't trigger flow

### Environment Check
1. Is webhook URL correct?
2. Does source system require signature verification?
3. Are headers being sent correctly?
4. Is authentication configured?

### Diagnosis Steps

#### **Step 1: Verify Webhook URL**
1. Copy URL from trigger configuration
2. Check it matches source system
3. Look for typos or extra characters
4. Verify protocol (http vs https)

#### **Step 2: Check Signature Requirements**
1. Review source system documentation
2. Check if signature verification required
3. Note signature algorithm (HMAC, etc.)
4. Find where secret is configured

#### **Step 3: Test Webhook**
1. Send test request from source
2. Check Defense Catalyst logs
3. Review request headers
4. Check signature header

#### **Step 4: Verify Authentication**
1. Check if webhook requires auth
2. Verify auth token/key is correct
3. Check auth header format
4. Test with correct credentials

### Common Webhook Issues

#### **Missing Signature Header**
**Symptoms**: "Signature header not found"
**Fix**:
1. Check source system sends signature
2. Verify header name is correct
3. Check signature is enabled in source
4. Review source documentation

#### **Invalid Signature**
**Symptoms**: "Signature verification failed"
**Fix**:
1. Verify webhook secret is correct
2. Check signature algorithm matches
3. Verify payload format
4. Check for encoding issues

#### **Wrong Webhook URL**
**Symptoms**: Requests go to wrong endpoint
**Fix**:
1. Copy correct URL from Defense Catalyst
2. Update in source system
3. Remove old webhooks
4. Test with new URL

#### **Authentication Required**
**Symptoms**: "401 Unauthorized"
**Fix**:
1. Check if webhook requires auth
2. Add authentication header
3. Use correct auth method
4. Verify credentials

#### **IP Whitelist**
**Symptoms**: Requests blocked
**Fix**:
1. Get Defense Catalyst IP addresses
2. Whitelist in source system
3. Check firewall rules
4. Verify network access

### Resolution Steps

**For Signature Issues**:
1. Get webhook secret from source
2. Configure in Defense Catalyst
3. Verify algorithm matches
4. Test webhook

**For Authentication Issues**:
1. Generate auth token
2. Configure in webhook
3. Test authentication
4. Verify permissions

**For URL Issues**:
1. Copy correct URL
2. Update in source
3. Delete old webhooks
4. Test new webhook

### Webhook Security Best Practices

#### **Always Verify Signatures**
- Prevents unauthorized requests
- Ensures data integrity
- Required for production

#### **Use HTTPS**
- Encrypts data in transit
- Prevents man-in-the-middle attacks
- Required for sensitive data

#### **Rotate Secrets**
- Change webhook secrets periodically
- Use strong, random secrets
- Don't share secrets

#### **Validate Payload**
- Check data format
- Validate required fields
- Sanitize inputs

### Prevention

- ✅ Always use signature verification
- ✅ Use HTTPS for webhooks
- ✅ Rotate secrets regularly
- ✅ Validate webhook payloads
- ✅ Monitor webhook health
- ✅ Document webhook configuration

### Related Articles
- [Webhook Integration](06-integration-webhook.md)
- [Security & Privacy](11-security-privacy.md)
- [Error Reference](08-error-reference.md)

---

## Flow Runs But Doesn't Do What I Expected

### Symptoms
- Flow completes successfully
- But results are wrong
- Actions don't match intent
- Data is incorrect

### Diagnosis Steps

#### **Step 1: Review Run Details**
1. Open successful run
2. Check each step's output
3. Verify data at each stage
4. Identify where it diverges

#### **Step 2: Check Logic**
1. Review conditions
2. Verify branching logic
3. Check data transformations
4. Verify action configuration

#### **Step 3: Test with Known Data**
1. Use test data with known outcome
2. Compare expected vs actual
3. Identify discrepancy

### Common Logic Issues

#### **Condition Logic Error**
**Fix**: Review condition operators (equals, contains, etc.)

#### **Wrong Data Mapping**
**Fix**: Verify data sources and paths

#### **Missing Steps**
**Fix**: Add missing actions

#### **Wrong Action Configuration**
**Fix**: Review action settings

### Resolution

1. Identify incorrect step
2. Fix configuration
3. Test with known data
4. Verify results

### Related Articles
- [Runs & Debugging](09-runs-logs-debugging.md)
- [Data Mapping](04-core-concepts.md#data-mapping)

---

## Performance Issues

### Symptoms
- Slow execution
- Timeouts
- High latency

### Diagnosis

1. Identify slow steps
2. Check external service performance
3. Review data size
4. Check network connectivity

### Optimization

- Reduce data size
- Batch operations
- Use caching
- Optimize queries
- Parallel processing

### Related Articles
- [Limits & Reliability](10-limits-reliability.md)

---

## Still Need Help?

If you couldn't resolve your issue:

1. Check [Error Reference](08-error-reference.md) for specific errors
2. Review [Runs & Debugging Guide](09-runs-logs-debugging.md)
3. Search [FAQ](15-faq.md)
4. [Contact Support](13-contact-support.md) with details

**When contacting support, include**:
- Workspace ID
- Flow ID
- Run ID
- Error message
- Steps to reproduce
- Screenshots

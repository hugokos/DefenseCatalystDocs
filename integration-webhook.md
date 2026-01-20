# Webhook Integration

Receive HTTP requests from external systems to trigger your Defense Catalyst workflows.

---

## What It Enables

The Webhook trigger allows you to:

- **Receive data** from external systems via HTTP POST requests
- **Create custom API endpoints** for your workflows
- **Integrate with any service** that can send HTTP requests
- **Build event-driven automations** that respond to external events
- **Accept webhooks** from third-party services

### Common Use Cases

**External System Integration**
- Receive data from custom applications
- Integrate with services that support webhooks
- Build custom APIs for your organization

**Event-Driven Workflows**
- Trigger flows when events occur in external systems
- Respond to real-time notifications
- Process incoming data immediately

**Third-Party Webhooks**
- GitHub push notifications
- Stripe payment events
- Twilio SMS received
- Custom service notifications

---

## How to Use

### Step 1: Add Webhook Trigger

1. Create a new flow in Defense Catalyst
2. Click **"Add Trigger"**
3. Search for **"Webhook"**
4. Select **"Webhook"** trigger

### Step 2: Get Your Webhook URL

Defense Catalyst automatically generates a unique webhook URL for your flow:

```
https://your-instance.defensecatalyst.com/api/v1/webhooks/[UNIQUE_ID]
```

**Copy this URL** - you'll need it to send requests to your flow.

### Step 3: Configure Webhook (Optional)

**Authentication:** (Optional)
- None - Anyone with the URL can trigger
- Header - Require specific header value
- Query Parameter - Require specific query parameter

**Response:** (Optional)
- Return custom response to webhook sender
- Default: Returns 200 OK

### Step 4: Test the Webhook

Send a test request to verify it works:

**Using curl:**
```bash
curl -X POST https://your-instance.defensecatalyst.com/api/v1/webhooks/[UNIQUE_ID] \
  -H "Content-Type: application/json" \
  -d '{"message": "Test", "value": 123}'
```

**Using PowerShell:**
```powershell
Invoke-WebRequest -Uri "https://your-instance.defensecatalyst.com/api/v1/webhooks/[UNIQUE_ID]" `
  -Method POST `
  -Body '{"message": "Test", "value": 123}' `
  -ContentType "application/json"
```

**Using Postman:**
1. Create new POST request
2. Enter your webhook URL
3. Set Body to raw JSON
4. Add your test data
5. Click Send

### Step 5: View Received Data

In Defense Catalyst:
1. The webhook trigger will show the received data
2. Expand the data structure to see all fields
3. This data is now available to use in your actions

---

## Webhook Data Structure

When a request is received, Defense Catalyst provides:

### Request Body
The JSON data sent in the request body.

**Access:** `{{webhook.body}}`

**Example:**
```json
{
  "message": "Hello",
  "value": 123,
  "nested": {
    "field": "data"
  }
}
```

**Usage:** `{{webhook.body.message}}` → "Hello"

### Request Headers
HTTP headers sent with the request.

**Access:** `{{webhook.headers}}`

**Common headers:**
- `content-type` - Data format
- `user-agent` - Client information
- `authorization` - Auth token (if provided)

### Query Parameters
URL query parameters.

**Access:** `{{webhook.query}}`

**Example URL:**
```
https://your-instance.defensecatalyst.com/api/v1/webhooks/[ID]?source=github&priority=high
```

**Usage:** `{{webhook.query.source}}` → "github"

### Metadata
Additional information about the request.

**Access:** `{{webhook.metadata}}`

**Includes:**
- `timestamp` - When request was received
- `method` - HTTP method (usually POST)
- `ip` - Sender's IP address

---

## Security

### Webhook URL Security

Your webhook URL is unique and acts as a secret. Protect it:

- ✅ Only share with trusted systems
- ✅ Use HTTPS (always enabled in Defense Catalyst)
- ✅ Rotate URLs if compromised (create new flow)
- ❌ Don't commit URLs to public repositories
- ❌ Don't share URLs publicly

### Authentication Options

#### No Authentication
Anyone with the URL can trigger your flow.

**Use when:**
- Testing and development
- Internal systems only
- Non-sensitive data

#### Header Authentication
Require a specific header value.

**Configuration:**
```
Header Name: X-API-Key
Expected Value: your-secret-key
```

**Request:**
```bash
curl -X POST [WEBHOOK_URL] \
  -H "X-API-Key: your-secret-key" \
  -H "Content-Type: application/json" \
  -d '{"data": "value"}'
```

#### Query Parameter Authentication
Require a specific query parameter.

**Configuration:**
```
Parameter Name: api_key
Expected Value: your-secret-key
```

**Request:**
```bash
curl -X POST "[WEBHOOK_URL]?api_key=your-secret-key" \
  -H "Content-Type: application/json" \
  -d '{"data": "value"}'
```

### Signature Verification

For services that sign webhooks (GitHub, Stripe, etc.):

1. Receive the signature header
2. Use Code action to verify signature
3. Reject invalid signatures

**Example (GitHub):**
```javascript
const crypto = require('crypto');
const signature = webhook.headers['x-hub-signature-256'];
const payload = JSON.stringify(webhook.body);
const secret = 'your-webhook-secret';

const expectedSignature = 'sha256=' + crypto
  .createHmac('sha256', secret)
  .update(payload)
  .digest('hex');

if (signature !== expectedSignature) {
  throw new Error('Invalid signature');
}
```

---

## Common Errors & Fixes

### "Webhook not found" (404)

**Cause:** Incorrect webhook URL.

**Solutions:**
1. Verify you copied the complete URL
2. Check for typos
3. Ensure flow is published
4. Regenerate webhook URL if needed

---

### "Method not allowed" (405)

**Cause:** Using wrong HTTP method (GET instead of POST).

**Solution:**
Use POST method for all webhook requests.

---

### "Unauthorized" (401)

**Cause:** Authentication failed.

**Solutions:**
1. Check authentication header/parameter is correct
2. Verify the expected value matches
3. Ensure header name is exact (case-sensitive)

---

### "Bad Request" (400)

**Cause:** Invalid request format.

**Solutions:**
1. Ensure Content-Type is `application/json`
2. Verify JSON is valid
3. Check for special characters that need escaping

---

### "Payload too large" (413)

**Cause:** Request body exceeds size limit.

**Solutions:**
1. Reduce payload size
2. Send data in multiple requests
3. Use pagination if available
4. Contact support for limit increase

---

## Test Checklist

- [ ] Webhook URL generated successfully
- [ ] Can send POST request to webhook
- [ ] Data appears in Defense Catalyst
- [ ] Can access webhook.body fields
- [ ] Can access webhook.headers
- [ ] Can access webhook.query parameters
- [ ] Authentication works (if configured)
- [ ] Flow triggers correctly
- [ ] Subsequent actions receive webhook data

---

## Tips & Best Practices

### Validate Input Data

Always validate data received from webhooks:

```javascript
// Check required fields exist
if (!webhook.body.id || !webhook.body.type) {
  throw new Error('Missing required fields');
}

// Validate data types
if (typeof webhook.body.value !== 'number') {
  throw new Error('Invalid value type');
}

// Validate ranges
if (webhook.body.priority < 1 || webhook.body.priority > 5) {
  throw new Error('Priority must be 1-5');
}
```

### Handle Errors Gracefully

Design flows to handle invalid or unexpected data:

- Check for required fields before using them
- Provide default values for optional fields
- Log errors for debugging
- Return meaningful error responses

### Return Appropriate Responses

Configure webhook responses based on your needs:

**Success response:**
```json
{
  "status": "success",
  "message": "Webhook received",
  "id": "{{run.id}}"
}
```

**Error response:**
```json
{
  "status": "error",
  "message": "Invalid data format"
}
```

### Use Idempotency

Make your webhooks idempotent to handle duplicate requests:

1. Include unique ID in webhook payload
2. Check if ID has been processed before
3. Skip processing if duplicate
4. Return success either way

### Monitor Webhook Health

Regularly check webhook performance:

- Review run history
- Check for failed runs
- Monitor response times
- Track error rates

### Document Your Webhook API

If others will use your webhook, document:

- Webhook URL (securely)
- Required headers
- Expected payload format
- Response format
- Error codes
- Rate limits

---

## Advanced Usage

### Conditional Processing

Process webhooks differently based on content:

```
Action 1: Check webhook.body.type
Action 2a: If type === 'alert' → Send to Slack
Action 2b: If type === 'report' → Save to database
Action 2c: If type === 'notification' → Send email
```

### Webhook Chaining

Trigger other webhooks from your flow:

```
Trigger: Webhook (receive data)
Action 1: Process data
Action 2: HTTP Request (send to another webhook)
```

### Batch Processing

Collect multiple webhook requests and process in batch:

1. Webhook saves data to database
2. Schedule trigger runs every hour
3. Fetch all new records
4. Process in batch
5. Mark as processed

### Webhook Replay

Store webhook payloads for replay:

1. Webhook receives data
2. Save to database with timestamp
3. Process normally
4. If processing fails, can replay from database

---

## Integration Examples

### GitHub Webhooks

Receive GitHub events:

**Setup in GitHub:**
1. Go to repository Settings → Webhooks
2. Add webhook
3. Paste Defense Catalyst webhook URL
4. Select events (push, pull request, issues, etc.)
5. Add secret for signature verification

**In Defense Catalyst:**
```
Trigger: Webhook
Action 1: Verify GitHub signature
Action 2: Check event type
Action 3: Process based on event
```

### Stripe Webhooks

Receive payment events:

**Setup in Stripe:**
1. Go to Developers → Webhooks
2. Add endpoint
3. Paste Defense Catalyst webhook URL
4. Select events (payment succeeded, subscription created, etc.)

**In Defense Catalyst:**
```
Trigger: Webhook
Action 1: Verify Stripe signature
Action 2: Process payment event
Action 3: Update database
Action 4: Send confirmation email
```

### Custom Application Integration

Integrate your own applications:

**In your application:**
```javascript
fetch('https://your-instance.defensecatalyst.com/api/v1/webhooks/[ID]', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-API-Key': 'your-secret-key'
  },
  body: JSON.stringify({
    event: 'user_signup',
    user: {
      id: 123,
      email: 'user@example.com',
      name: 'John Doe'
    },
    timestamp: new Date().toISOString()
  })
});
```

**In Defense Catalyst:**
```
Trigger: Webhook
Action 1: Validate API key
Action 2: Create user in CRM
Action 3: Send welcome email
Action 4: Notify team in Slack
```

---

## Related Documentation

- [Build Your First Workflow](first-workflow-tutorial.md) - Uses webhook trigger
- [HTTP Request Integration](integration-http.md) - Send webhooks to other services
- [Core Concepts: Triggers](core-concepts.md#triggers-vs-actions)
- [Troubleshooting: Workflow Won't Trigger](troubleshooting-hub.md#my-workflow-wont-trigger)

---

## Need Help?

**Defense Catalyst Support:** help@defensecatalyst.com

**Common Issues:** [Troubleshooting Hub](troubleshooting-hub.md)


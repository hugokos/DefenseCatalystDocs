# Build Your First Workflow

Welcome! This tutorial will guide you through creating your first Defense Catalyst workflow from start to finish. By the end, you'll understand how to build, test, and publish automated workflows.

## What You'll Build

You'll create a workflow that sends a Slack message when a webhook is received. This is a common pattern used for:
- Receiving notifications from external systems
- Integrating with custom applications
- Creating custom API endpoints
- Building event-driven automations

**Time required:** 10-15 minutes

---

## Prerequisites

Before you begin, make sure you have:
- Access to a Defense Catalyst workspace
- A Slack workspace where you can add integrations (or you can adapt this tutorial to use Discord, Email, or another messaging service)
- Basic familiarity with web concepts (URLs, HTTP requests)

---

## Step 1: Create a New Flow

Let's start by creating a new workflow.

### Actions:

1. Log into Defense Catalyst
2. Click the **"New Flow"** button (usually in the top right or sidebar)
3. Give your flow a descriptive name: **"Webhook to Slack Notification"**
4. Click **"Create"** or press Enter

### What You'll See:

The flow builder interface will open, showing:
- An empty canvas where you'll build your workflow
- A sidebar with available triggers and actions
- A toolbar with save, test, and publish options

The flow builder is your workspace for creating automations. You'll add steps to the canvas and configure them to build your workflow.

---

## Step 2: Add a Webhook Trigger

Every flow starts with a trigger. We'll use a webhook trigger, which creates a URL that external systems can call to start your flow.

### Actions:

1. Click **"Add Trigger"** or the **"+"** button on the canvas
2. Search for **"Webhook"** in the trigger list
3. Select **"Webhook"** trigger
4. The webhook configuration panel will open

### Configure the Webhook:

1. **Trigger Name:** Leave as "Webhook" or rename to something descriptive like "Receive Alert"
2. **Webhook URL:** Defense Catalyst automatically generates a unique URL for you
3. Click the **"Copy"** button next to the webhook URL to copy it to your clipboard
4. Save this URL somewhere - you'll need it for testing

### Understanding Webhooks:

A webhook is like a mailbox for your workflow. When someone sends data to your webhook URL, your flow receives it and starts executing. The data sent to the webhook becomes available to use in your actions.

---

## Step 3: Test the Webhook

Before adding actions, let's test that the webhook works.

### Actions:

1. Open a new browser tab or use a tool like Postman, curl, or your terminal
2. Send a test request to your webhook URL

**Using curl (in terminal):**
```bash
curl -X POST [YOUR_WEBHOOK_URL] \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello from Defense Catalyst!", "priority": "high"}'
```

**Using PowerShell (Windows):**
```powershell
Invoke-WebRequest -Uri "[YOUR_WEBHOOK_URL]" -Method POST -Body '{"message": "Hello from Defense Catalyst!", "priority": "high"}' -ContentType "application/json"
```

3. Return to Defense Catalyst
4. You should see the test data appear in the webhook configuration panel
5. Expand the data to see the structure: `message` and `priority` fields

### What Just Happened:

You sent data to your webhook, and Defense Catalyst captured it. This test data will be used to help you configure the next steps. You can see exactly what data is available to use in your actions.

---

## Step 4: Add a Slack Action

Now let's add an action that sends a message to Slack.

### Actions:

1. Click the **"+"** button below your webhook trigger
2. Search for **"Slack"** in the actions list
3. Select **"Send Message to Channel"** action
4. The Slack configuration panel will open

### What You'll See:

The action configuration has several fields:
- **Connection:** Where you authenticate with Slack
- **Channel:** Which Slack channel to send to
- **Message:** What to send

---

## Step 5: Connect to Slack

Before you can send messages, you need to connect Defense Catalyst to your Slack workspace.

### Actions:

1. In the **Connection** field, click **"+ New Connection"**
2. A popup will appear asking you to authorize Defense Catalyst
3. Click **"Connect to Slack"** or **"Authorize"**
4. You'll be redirected to Slack's authorization page
5. Select your Slack workspace
6. Review the permissions (Defense Catalyst needs permission to send messages)
7. Click **"Allow"** or **"Authorize"**
8. You'll be redirected back to Defense Catalyst
9. Your connection is now saved and will appear in the dropdown

### Understanding Connections:

Connections store your authentication credentials securely. Once you create a Slack connection, you can reuse it in any flow without re-authorizing. Defense Catalyst encrypts and protects your credentials.

---

## Step 6: Configure the Slack Message

Now let's configure what message to send and where to send it.

### Actions:

1. **Connection:** Select the Slack connection you just created
2. **Channel:** Click the dropdown and select a channel (e.g., #general, #alerts, or a test channel)
3. **Message:** This is where we'll use data from the webhook

### Map Data from the Webhook:

Instead of typing a static message, we'll use the data sent to the webhook. This makes your workflow dynamic.

1. Click in the **Message** field
2. You'll see a **data picker** icon or a **"{ }"** button
3. Click it to open the data picker
4. You'll see the webhook step with the test data you sent
5. Navigate to: **Webhook → body → message**
6. Click to insert it

Your message field should now show something like: `{{webhook.body.message}}`

### Add Context to the Message:

Let's make the message more informative:

```
🚨 New Alert Received

Message: {{webhook.body.message}}
Priority: {{webhook.body.priority}}

Received at: {{webhook.timestamp}}
```

This creates a formatted message using data from the webhook. The `{{ }}` syntax tells Defense Catalyst to insert dynamic data.

---

## Step 7: Test Your Flow

Before publishing, let's test the complete workflow.

### Actions:

1. Click the **"Test"** button in the toolbar
2. Defense Catalyst will execute your flow using the test data from the webhook
3. Watch as each step executes:
   - Webhook trigger (using test data)
   - Slack action (sending message)
4. Check your Slack channel - you should see the message appear!

### What to Look For:

- ✅ Both steps show green checkmarks (success)
- ✅ The Slack message appears in your channel
- ✅ The message contains the data from your webhook test

### If Something Goes Wrong:

- **Slack action fails:** Check that your connection is valid and you have permission to post in the selected channel
- **Message is empty:** Verify you mapped the data correctly from the webhook
- **No message in Slack:** Check you selected the right channel and the Slack app has permission to post

---

## Step 8: Test with a Real Webhook Call

Now let's test the flow end-to-end by sending a new webhook request.

### Actions:

1. Send another request to your webhook URL with different data:

```bash
curl -X POST [YOUR_WEBHOOK_URL] \
  -H "Content-Type: application/json" \
  -d '{"message": "System backup completed successfully", "priority": "low"}'
```

2. Return to Defense Catalyst
3. Click **"Runs"** or **"History"** to see your flow executions
4. You should see a new run that was triggered by your webhook call
5. Check Slack - you should see the new message with the updated data

### What Just Happened:

Your flow is now live! When you send data to the webhook URL, Defense Catalyst automatically:
1. Receives the webhook request
2. Extracts the data
3. Sends a formatted message to Slack
4. Logs the execution

---

## Step 9: Publish Your Flow

Right now, your flow is in draft mode. Let's publish it to make it officially active.

### Actions:

1. Click the **"Publish"** button in the toolbar
2. Review the confirmation dialog
3. Click **"Publish"** to confirm

### Understanding Draft vs Published:

- **Draft:** Flow is being built/edited. Webhook triggers work for testing, but the flow isn't considered "production ready"
- **Published:** Flow is live and active. All triggers work normally, and the flow is ready for production use

You can always unpublish a flow to make changes, then republish when ready.

---

## Step 10: Monitor Your Flow

Now that your flow is published, you should monitor it to ensure it's working correctly.

### Actions:

1. Click on **"Runs"** or **"History"** in the navigation
2. You'll see a list of all executions of your flow
3. Click on any run to see details:
   - What data was received
   - What actions were taken
   - Whether it succeeded or failed
   - How long it took

### Best Practices:

- Check run history regularly, especially after publishing
- Set up alerts for failed runs (you can create a flow for this!)
- Review execution times to ensure performance is acceptable

---

## What You Learned

Congratulations! You've successfully created, tested, and published your first Defense Catalyst workflow. Here's what you learned:

### Core Skills:

✅ **Creating flows** - How to start a new workflow and name it  
✅ **Adding triggers** - How to add a webhook trigger and get its URL  
✅ **Adding actions** - How to add a Slack action to send messages  
✅ **Connecting apps** - How to authenticate with external services using OAuth  
✅ **Mapping data** - How to use data from one step in another step  
✅ **Testing flows** - How to test workflows before publishing  
✅ **Publishing flows** - How to make workflows live and active  
✅ **Monitoring runs** - How to view execution history and debug issues

### Key Concepts:

- **Triggers start flows** - Every flow begins with exactly one trigger
- **Actions do the work** - Flows can have multiple actions in sequence
- **Data flows between steps** - Output from one step can be used as input for the next
- **Connections are reusable** - Create once, use in multiple flows
- **Test before publishing** - Always verify your flow works with real data

---

## Next Steps

Now that you've built your first workflow, here are some ideas for what to do next:

### Enhance This Flow

Try adding more functionality to your webhook-to-Slack flow:

**Add Conditional Logic:**
- Only send Slack messages for high-priority alerts
- Route different priorities to different channels
- Add emoji based on priority level

**Add More Actions:**
- Log the alert to a Google Sheet
- Create a ticket in Jira for high-priority items
- Send an email for critical alerts

**Transform the Data:**
- Format timestamps in a readable way
- Parse JSON data from the webhook
- Calculate values or aggregate data

### Try Different Triggers

Explore other ways to start workflows:

**Schedule Trigger:**
- Run a report every morning at 9 AM
- Check for new data every hour
- Perform cleanup tasks weekly

**App Event Trigger:**
- When a new email arrives (Gmail, Outlook)
- When a file is added to a folder (Google Drive, Dropbox)
- When a GitHub issue is created

**Polling Trigger:**
- Check an API for new records
- Monitor a database for changes
- Watch for new files in an S3 bucket

### Explore More Integrations

Defense Catalyst supports 280+ integrations. Try connecting:

**Data & Databases:**
- Google Sheets - Read and write spreadsheet data
- Airtable - Manage records in your bases
- PostgreSQL - Query and update databases

**AI & ML:**
- OpenAI - Generate text, analyze content, create embeddings
- Anthropic - Use Claude for advanced reasoning
- Hugging Face - Access thousands of AI models

**Development Tools:**
- GitHub - Automate repository management
- GitLab - Manage issues and merge requests
- Jira - Create and update tickets

**[→ Browse All Integrations](integrations-directory.md)**

### Learn Advanced Concepts

Deepen your knowledge with these topics:

**[Core Concepts →](core-concepts.md)**
- Advanced data mapping techniques
- Understanding run statuses and retries
- Working with arrays and objects
- Using expressions and transformations

**[Runs, Logs & Debugging →](runs-logs-debugging.md)**
- Debugging failed runs
- Understanding error messages
- Performance optimization
- Best practices for production workflows

**[Troubleshooting Hub →](troubleshooting-hub.md)**
- Common issues and solutions
- Symptom-based problem solving
- Error reference guide

---

## Tips for Building Great Workflows

### Start Simple, Then Iterate
Begin with a basic workflow that solves one problem. Once it's working, add more features and complexity. It's easier to debug a simple flow than a complex one.

### Use Descriptive Names
Name your flows and steps clearly:
- ❌ "Flow 1", "Step 2"
- ✅ "Webhook to Slack Notification", "Send Alert to #ops-team"

### Test with Real Data
Don't just test with perfect data. Try edge cases:
- Empty values
- Missing fields
- Unexpected data types
- Large datasets

### Handle Errors Gracefully
Think about what happens when things go wrong:
- What if the Slack API is down?
- What if the webhook receives malformed data?
- What if a required field is missing?

Add error handling and fallback logic to make your flows resilient.

### Document Your Flows
Add descriptions to your flows explaining:
- What the flow does
- Why it exists
- Any special considerations
- Who to contact for questions

### Monitor and Maintain
Workflows aren't "set and forget":
- Check run history regularly
- Update connections when credentials change
- Optimize slow-running flows
- Archive flows you no longer need

---

## Get Help

### Need Assistance?

**[Troubleshooting Hub →](troubleshooting-hub.md)**  
Find solutions to common problems

**[FAQ →](faq.md)**  
Quick answers to frequently asked questions

**[Contact Support →](contact-support.md)**  
Email help@defensecatalyst.com for personalized help

### Share Your Success

Built something cool? We'd love to hear about it! Share your workflows and automation wins with the Defense Catalyst community.

---

**Ready to build more?** → [Explore Integrations](integrations-directory.md)

**Want to go deeper?** → [Core Concepts](core-concepts.md)


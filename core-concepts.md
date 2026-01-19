# Core Concepts

This guide provides a deep dive into the fundamental concepts that power Defense Catalyst workflows. Understanding these concepts will help you build more sophisticated and reliable automations.

---

## Triggers vs Actions

Every Defense Catalyst workflow consists of triggers and actions. Understanding the difference is essential.

### Triggers: What Starts Your Flow

A trigger is the event that initiates your workflow. Every flow has exactly one trigger that determines when and how the flow executes.

**Key characteristics:**
- Every flow must have exactly one trigger
- Triggers are always the first step in a flow
- Triggers provide initial data to the flow
- Triggers determine execution frequency

### Types of Triggers

#### Webhook Trigger
Receives HTTP requests from external systems. Creates a unique URL that other services can call to start your flow.

**Use cases:**
- Receiving data from external APIs
- Creating custom API endpoints
- Integrating with systems that support webhooks
- Building event-driven architectures

**How it works:**
1. Defense Catalyst generates a unique webhook URL
2. External system sends HTTP POST request to the URL
3. Flow receives the request body as data
4. Flow executes with the received data

#### Schedule Trigger
Runs your flow on a timer at specified intervals.

**Use cases:**
- Daily reports
- Hourly data synchronization
- Weekly cleanup tasks
- Monthly aggregations

**Schedule options:**
- **Simple intervals:** Every X minutes/hours/days
- **Cron expressions:** Advanced scheduling (e.g., "Every weekday at 9 AM")
- **Specific times:** Run at exact times

**Examples:**
- `0 9 * * 1-5` - Every weekday at 9:00 AM
- `0 */4 * * *` - Every 4 hours
- `0 0 1 * *` - First day of every month at midnight

#### App Event Trigger
Starts your flow when something happens in a connected app.

**Use cases:**
- New email received (Gmail, Outlook)
- New file added (Google Drive, Dropbox)
- New issue created (GitHub, Jira)
- New message posted (Slack, Discord)

**How it works:**
1. Defense Catalyst subscribes to events from the app
2. When an event occurs, the app notifies Defense Catalyst
3. Flow executes with event data

**Note:** Requires the app to support webhooks or real-time notifications.

#### Polling Trigger
Periodically checks for new data and triggers when found.

**Use cases:**
- Monitoring APIs without webhook support
- Checking databases for new records
- Watching for file changes
- Detecting new items in feeds

**How it works:**
1. Defense Catalyst checks the source on a schedule
2. Compares current state to previous state
3. If new items are found, triggers once per new item
4. Stores state to avoid duplicate triggers

**Polling interval:** Typically 5-15 minutes (configurable)

---

### Actions: What Your Flow Does

Actions are the tasks your flow performs. Flows can have multiple actions that execute in sequence.

**Key characteristics:**
- Flows can have unlimited actions
- Actions execute in order from top to bottom
- Each action receives data from previous steps
- Actions can transform, send, create, update, or delete data

### Common Action Types

#### Send/Notify Actions
- Send Slack message
- Send email
- Send Discord message
- Send SMS
- Post to webhook

#### Data Actions
- Create database record
- Update spreadsheet row
- Query database
- Read file
- Write file

#### API Actions
- HTTP request
- Call REST API
- Call GraphQL API
- SOAP request

#### Transform Actions
- Parse JSON
- Format text
- Convert data types
- Calculate values
- Filter arrays

#### Logic Actions
- Conditional (if/then)
- Loop (iterate over items)
- Delay (wait before continuing)
- Stop flow

---

### Combining Triggers and Actions

The power of Defense Catalyst comes from combining triggers and actions creatively.

**Simple pattern:**
```
Trigger: Webhook
Action: Send Slack message
```

**Multi-step pattern:**
```
Trigger: Schedule (daily at 9 AM)
Action 1: Query database for new records
Action 2: Transform data to CSV
Action 3: Send email with CSV attachment
```

**Conditional pattern:**
```
Trigger: New GitHub issue
Action 1: Check if issue has "bug" label
Action 2a: If yes → Create Jira ticket
Action 2b: If no → Send Slack notification
```

---

## Connections & Authentication

Connections store your credentials for external services securely. Understanding how connections work helps you manage integrations effectively.

### What Are Connections?

A connection is a saved set of credentials that allows Defense Catalyst to access an external service on your behalf. Once created, connections can be reused across multiple flows.

**Benefits:**
- **Reusability:** Create once, use in many flows
- **Security:** Credentials are encrypted and never exposed
- **Convenience:** No need to re-enter credentials
- **Management:** Update or revoke access in one place

---

### Types of Authentication

#### OAuth (Recommended)
The most secure and user-friendly authentication method. You authorize Defense Catalyst through the service's official login page.

**How it works:**
1. Click "Connect" in Defense Catalyst
2. Redirected to the service's authorization page
3. Log in with your credentials (on the service's site)
4. Review and approve permissions
5. Redirected back to Defense Catalyst
6. Connection is saved

**Services using OAuth:**
- Google (Gmail, Sheets, Drive, Calendar)
- Microsoft (Outlook, OneDrive, Teams)
- Slack
- GitHub
- GitLab
- Salesforce
- Many others

**Advantages:**
- Most secure method
- No need to share passwords with Defense Catalyst
- Easy to revoke access
- Supports granular permissions

#### API Key
You provide an API key or token from the service.

**How it works:**
1. Generate an API key in the service's settings
2. Copy the API key
3. Paste it into Defense Catalyst
4. Connection is saved

**Services using API keys:**
- OpenAI
- Anthropic
- Many REST APIs
- Custom services

**Best practices:**
- Use keys with minimal required permissions
- Rotate keys regularly
- Never share keys publicly
- Revoke unused keys

#### Username & Password
Basic authentication using a username and password.

**How it works:**
1. Enter your username
2. Enter your password
3. Connection is saved (credentials encrypted)

**Services using basic auth:**
- SMTP email servers
- Some databases
- Legacy systems
- Internal tools

**Security note:** Only use with trusted services. OAuth is preferred when available.

#### Custom Authentication
Advanced authentication for specialized systems.

**Examples:**
- JWT tokens
- Certificate-based auth
- Multi-factor authentication
- Custom headers
- Signature-based auth

**When to use:** For enterprise systems, government services, or specialized integrations.

---

### Managing Connections

#### Creating Connections

**Method 1: During flow building**
1. Add an action that requires a connection
2. Click "+ New Connection"
3. Follow the authentication flow
4. Connection is created and selected

**Method 2: From connections page**
1. Navigate to Connections in the sidebar
2. Click "New Connection"
3. Select the service
4. Follow the authentication flow
5. Connection is saved for future use

#### Reusing Connections

Once created, connections appear in dropdowns when configuring actions. Select an existing connection instead of creating a new one.

**Benefits:**
- Faster flow building
- Consistent credentials across flows
- Easier to manage and update

#### Updating Connections

If credentials change or expire:
1. Go to Connections page
2. Find the connection
3. Click "Reconnect" or "Edit"
4. Follow the authentication flow again
5. All flows using this connection are automatically updated

#### Deleting Connections

To remove a connection:
1. Go to Connections page
2. Find the connection
3. Click "Delete"
4. Confirm deletion

**Warning:** Flows using this connection will fail until you provide a new connection.

---

### Security Best Practices

#### Use Least Privilege
Only grant the minimum permissions needed. If a flow only reads data, don't grant write permissions.

#### Rotate Credentials Regularly
For API keys and passwords, rotate them periodically (every 90 days recommended).

#### Monitor Connection Usage
Regularly review which connections are in use and remove unused ones.

#### Use Service Accounts
For team workflows, use service accounts or bot accounts instead of personal accounts.

#### Enable MFA
When possible, enable multi-factor authentication on the services you connect.

#### Audit Access
Review which flows have access to sensitive connections. Remove access when no longer needed.

---

## Data Mapping

Data mapping is how you pass information from one step to another. Mastering data mapping is key to building powerful workflows.

### Understanding Data Flow

In Defense Catalyst, data flows from step to step:

```
Step 1 (Trigger) → produces output data
    ↓
Step 2 (Action) → receives input data, produces output data
    ↓
Step 3 (Action) → receives input data, produces output data
```

Each step can access data from any previous step.

---

### Using the Data Picker

The data picker is your tool for selecting data from previous steps.

**How to use:**
1. Click in a field that accepts dynamic data
2. Click the data picker icon (usually `{ }` or a variable icon)
3. Browse available data from previous steps
4. Click to insert the data reference

**What you'll see:**
- List of previous steps
- Data structure from each step
- Preview of actual values (from test data)

---

### Common Data Types

#### Text (String)
Simple text values.

**Examples:**
- `"Hello, World!"`
- `"user@example.com"`
- `"2024-01-15"`

**Operations:**
- Concatenate: Combine multiple strings
- Substring: Extract part of a string
- Replace: Find and replace text
- Case conversion: Upper, lower, title case

#### Numbers
Numeric values for calculations.

**Examples:**
- `42`
- `3.14159`
- `-17`

**Operations:**
- Math: Add, subtract, multiply, divide
- Rounding: Round, floor, ceiling
- Formatting: Currency, percentages

#### Dates & Times
Temporal values.

**Examples:**
- `2024-01-15T10:30:00Z`
- `1705318200` (Unix timestamp)

**Operations:**
- Format: Convert to readable format
- Parse: Convert from string to date
- Calculate: Add/subtract time
- Extract: Get year, month, day, etc.

#### Booleans
True/false values.

**Examples:**
- `true`
- `false`

**Use cases:**
- Conditional logic
- Feature flags
- Status indicators

#### Arrays (Lists)
Ordered collections of items.

**Examples:**
```json
["apple", "banana", "cherry"]
[1, 2, 3, 4, 5]
[{"name": "Alice"}, {"name": "Bob"}]
```

**Operations:**
- Filter: Select items matching criteria
- Map: Transform each item
- Find: Get first matching item
- Length: Count items
- Join: Combine into string

#### Objects
Structured data with named fields.

**Examples:**
```json
{
  "name": "Alice",
  "email": "alice@example.com",
  "age": 30
}
```

**Operations:**
- Access fields: `object.name`
- Nested access: `object.address.city`
- Check existence: Does field exist?

---

### Data Transformations

#### Text Manipulation

**Concatenation:**
Combine multiple values:
```
"Hello, " + {{user.name}} + "!"
```

**Substring:**
Extract part of a string:
```
{{email}}.substring(0, {{email}}.indexOf('@'))
```

**Replace:**
Find and replace text:
```
{{text}}.replace('old', 'new')
```

**Case conversion:**
```
{{text}}.toUpperCase()
{{text}}.toLowerCase()
```

#### Date Formatting

**Format date:**
```
{{date}}.format('YYYY-MM-DD')
{{date}}.format('MMM DD, YYYY')
```

**Parse date:**
```
Date.parse({{dateString}})
```

**Add/subtract time:**
```
{{date}}.add(7, 'days')
{{date}}.subtract(1, 'hour')
```

#### JSON Parsing

**Parse JSON string:**
```
JSON.parse({{jsonString}})
```

**Stringify object:**
```
JSON.stringify({{object}})
```

**Access nested data:**
```
{{response.body.data.items[0].name}}
```

#### Array Operations

**Filter array:**
```
{{items}}.filter(item => item.status === 'active')
```

**Map array:**
```
{{items}}.map(item => item.name)
```

**Find item:**
```
{{items}}.find(item => item.id === 123)
```

**Join array:**
```
{{items}}.join(', ')
```

---

### Variables and Expressions

Defense Catalyst supports expressions for dynamic data manipulation.

**Simple variable:**
```
{{webhook.body.message}}
```

**Expression:**
```
{{webhook.body.count * 2}}
```

**Conditional:**
```
{{webhook.body.priority === 'high' ? '🚨' : '📝'}}
```

**Function call:**
```
{{Math.round(webhook.body.value)}}
```

---

### Testing Data Mapping

Always test your data mapping with real data:

1. **Use test data:** Send real data to your trigger
2. **Inspect output:** Check what each step produces
3. **Verify transformations:** Ensure data is transformed correctly
4. **Handle edge cases:** Test with empty, null, or unexpected values

**Common issues:**
- Field doesn't exist → Check spelling and structure
- Value is null → Add default value or conditional
- Type mismatch → Convert data type explicitly
- Array is empty → Check filter conditions

---

## Runs & Execution

Understanding how flows execute helps you build reliable automations and debug issues.

### What is a Run?

A run is a single execution of your flow from start to finish. Every time your trigger fires, Defense Catalyst creates a new run.

**Run lifecycle:**
1. Trigger fires
2. Run is created
3. Steps execute in sequence
4. Run completes (success or failure)
5. Run is logged in history

---

### Run Statuses

#### Running
The flow is currently executing. Steps are being processed in real-time.

**What to do:** Wait for completion. You can watch the execution in real-time.

#### Succeeded
The flow completed successfully. All steps executed without errors.

**What to do:** Review the output to verify it did what you expected.

#### Failed
The flow encountered an error and stopped executing.

**What to do:** 
1. Check which step failed
2. Read the error message
3. Fix the issue
4. Retry the run or wait for the next trigger

#### Stopped
The flow was manually stopped before completion.

**What to do:** Investigate why it was stopped. Resume or restart if needed.

---

### Viewing Run History

Access your run history to monitor and debug flows:

1. Navigate to **Runs** or **History** in the sidebar
2. See all runs across all flows
3. Filter by:
   - Flow name
   - Status (succeeded, failed, running)
   - Date range
   - Trigger type

**What you'll see:**
- Run ID (unique identifier)
- Flow name
- Status
- Start time
- Duration
- Trigger that started it

---

### Inspecting Run Details

Click on any run to see detailed information:

#### Overview
- Run ID
- Flow name and version
- Status
- Start and end time
- Total duration
- Trigger information

#### Step-by-Step Execution
- Each step in the flow
- Input data for each step
- Output data produced
- Execution time per step
- Success/failure status

#### Input Data
The data that started the flow (from the trigger).

#### Output Data
The final result produced by the flow.

#### Error Messages
If the run failed, detailed error information including:
- Which step failed
- Error message
- Stack trace (for debugging)
- Suggested fixes

---

### Retries

Defense Catalyst can automatically retry failed runs to handle transient errors.

#### Automatic Retries

For certain types of failures, Defense Catalyst automatically retries:

**Retry-able errors:**
- Network timeouts
- Rate limit errors (with backoff)
- Temporary service unavailability
- Connection timeouts

**Non-retry-able errors:**
- Authentication failures
- Invalid configuration
- Data validation errors
- Permission denied

**Retry behavior:**
- **Attempts:** Up to 3 automatic retries
- **Backoff:** Exponential delay between retries (1 min, 5 min, 15 min)
- **Success:** If any retry succeeds, run is marked as succeeded
- **Failure:** If all retries fail, run is marked as failed

#### Manual Retries

You can manually retry any failed run:

1. Open the failed run
2. Click **"Retry"** button
3. Flow executes again with the same input data

**When to use:**
- After fixing a configuration error
- After service is back online
- After updating a connection
- To reprocess failed data

---

### Idempotency

Idempotency means running the same operation multiple times produces the same result. This is important for reliable automations.

**Why it matters:**
- Retries don't create duplicates
- Safe to reprocess data
- Prevents unintended side effects

**How to achieve idempotency:**

**Use unique identifiers:**
```
Create record with ID: {{webhook.body.id}}
If record exists, update instead of create
```

**Check before acting:**
```
1. Check if record exists
2. If exists, skip or update
3. If not exists, create
```

**Use upsert operations:**
Many services support "upsert" (update or insert) which is naturally idempotent.

**Track processed items:**
Maintain a list of processed IDs to avoid reprocessing.

---

## Environments

Defense Catalyst supports multiple environments for safe development and testing.

### Development Environment

Use for building and testing new flows.

**Characteristics:**
- Safe to experiment
- Can use test data
- Errors don't affect production
- Can be reset or cleared

**Best practices:**
- Build all new flows here first
- Test thoroughly with realistic data
- Verify all integrations work
- Check error handling

### Production Environment

Use for live, mission-critical workflows.

**Characteristics:**
- Processes real data
- Affects real systems
- Monitored closely
- Changes require approval

**Best practices:**
- Only promote tested flows
- Monitor run history regularly
- Set up alerts for failures
- Document all flows
- Have rollback plan

### Promoting Flows

Move flows from development to production:

1. Test thoroughly in development
2. Export flow configuration
3. Import to production
4. Update connections (use production credentials)
5. Test in production with limited scope
6. Enable fully once verified

---

## Best Practices

### Design Principles

**Start simple:** Begin with basic workflows and add complexity gradually.

**Single responsibility:** Each flow should do one thing well.

**Error handling:** Always plan for failures and add appropriate error handling.

**Logging:** Include steps that log important information for debugging.

**Documentation:** Add descriptions to flows and steps explaining their purpose.

### Performance

**Minimize API calls:** Batch operations when possible to reduce API calls.

**Use caching:** Store frequently accessed data to avoid repeated lookups.

**Optimize data:** Only pass necessary data between steps to reduce processing time.

**Parallel execution:** When possible, use parallel branches for independent operations.

### Reliability

**Test thoroughly:** Always test with real data before publishing.

**Handle edge cases:** Consider what happens with empty, null, or unexpected data.

**Set timeouts:** Configure appropriate timeouts for slow operations.

**Monitor actively:** Check run history regularly to catch issues early.

**Plan for failures:** Design flows to gracefully handle errors and retries.

### Security

**Least privilege:** Only grant minimum necessary permissions.

**Encrypt sensitive data:** Use connections for credentials, never hardcode.

**Validate input:** Always validate data from external sources.

**Audit regularly:** Review flows and connections periodically.

**Rotate credentials:** Update API keys and passwords regularly.

---

## Next Steps

**[Build Your First Workflow →](03-first-workflow-tutorial.md)**  
Put these concepts into practice with a hands-on tutorial

**[Integrations Directory →](05-integrations-directory.md)**  
Explore 280+ integrations you can use in your flows

**[Troubleshooting Hub →](07-troubleshooting-hub.md)**  
Learn how to diagnose and fix common issues

**[Runs, Logs & Debugging →](09-runs-logs-debugging.md)**  
Master the tools for monitoring and debugging flows

---

**Need help?** Contact support at help@defensecatalyst.com

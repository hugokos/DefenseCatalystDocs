# Slack Integration

Connect Defense Catalyst to Slack to send messages, post updates, and automate team communication.

---

## What It Enables

The Slack integration allows you to:

- **Send messages** to channels, users, or threads
- **Post rich messages** with formatting, attachments, and blocks
- **Upload files** to channels
- **Manage channels** (create, archive, invite users)
- **React to messages** with emoji
- **Update messages** after posting
- **Trigger flows** when messages are posted (with Slack Events API)

### Common Use Cases

**Alerts & Notifications**
- Send alerts when errors occur
- Notify team of system events
- Post deployment notifications
- Alert on security events

**Status Updates**
- Post daily reports to channels
- Share build status
- Update project progress
- Broadcast announcements

**Data Sharing**
- Share reports and dashboards
- Post analytics summaries
- Distribute generated content
- Share file uploads

**Team Coordination**
- Create channels for new projects
- Invite users to channels
- Archive completed project channels
- Manage team communication

---

## Prerequisites

Before connecting Slack to Defense Catalyst:

- **Slack workspace** where you have permission to add apps
- **Admin approval** (if your workspace requires it)
- **Channel access** to the channels you want to post in

### Permissions Needed

The Slack integration requests these permissions (scopes):

- `chat:write` - Send messages as the bot
- `channels:read` - View public channels
- `channels:manage` - Create and manage channels (optional)
- `files:write` - Upload files (optional)
- `users:read` - View user information (optional)

You can review and approve these during the OAuth flow.

---

## How to Connect

### Step 1: Add Slack Action to Your Flow

1. Open your flow in Defense Catalyst
2. Click **"+"** to add a new action
3. Search for **"Slack"**
4. Select **"Send Message to Channel"** (or another Slack action)

### Step 2: Create New Connection

1. In the **Connection** field, click **"+ New Connection"**
2. A popup will appear
3. Click **"Connect to Slack"**

### Step 3: Authorize Defense Catalyst

1. You'll be redirected to Slack's authorization page
2. **Select your workspace** from the dropdown (if you're in multiple workspaces)
3. Review the permissions Defense Catalyst is requesting
4. Click **"Allow"** to authorize

### Step 4: Return to Defense Catalyst

1. You'll be automatically redirected back to Defense Catalyst
2. Your Slack connection is now created and selected
3. You can now configure your Slack action

### Step 5: Test the Connection

1. Select a channel from the dropdown
2. Enter a test message
3. Click **"Test"** to send the message
4. Check your Slack channel to verify the message appeared

---

## Available Actions

### Send Message to Channel

Post a message to a Slack channel.

**Configuration:**
- **Connection:** Your Slack connection
- **Channel:** Select from dropdown or enter channel ID
- **Message:** The text to send (supports Slack markdown)
- **Thread:** (Optional) Reply to a specific thread
- **Username:** (Optional) Custom bot name
- **Icon:** (Optional) Custom bot icon

**Example:**
```
Channel: #alerts
Message: 🚨 System Alert: {{error.message}}

Timestamp: {{run.timestamp}}
Severity: {{error.severity}}
```

**Output:**
- Message ID
- Timestamp
- Channel ID
- Permalink to message

---

### Send Direct Message

Send a private message to a Slack user.

**Configuration:**
- **Connection:** Your Slack connection
- **User:** Select user or enter user ID
- **Message:** The text to send

**Example:**
```
User: @john.doe
Message: Your report is ready: {{report.url}}
```

---

### Upload File

Upload a file to a Slack channel.

**Configuration:**
- **Connection:** Your Slack connection
- **Channel:** Where to upload the file
- **File:** File content or URL
- **Filename:** Name for the file
- **Comment:** (Optional) Message with the file

**Example:**
```
Channel: #reports
File: {{report.csv}}
Filename: daily-report-{{date}}.csv
Comment: Here's today's report
```

---

### Create Channel

Create a new Slack channel.

**Configuration:**
- **Connection:** Your Slack connection
- **Name:** Channel name (lowercase, no spaces)
- **Private:** Public or private channel
- **Description:** (Optional) Channel description

**Example:**
```
Name: project-{{project.id}}
Private: false
Description: Channel for {{project.name}}
```

---

### Add User to Channel

Invite a user to a channel.

**Configuration:**
- **Connection:** Your Slack connection
- **Channel:** Channel to invite to
- **User:** User to invite

---

### Update Message

Edit a previously sent message.

**Configuration:**
- **Connection:** Your Slack connection
- **Channel:** Channel containing the message
- **Message Timestamp:** Timestamp of message to update
- **New Message:** Updated text

**Use case:** Update a status message as a process progresses.

---

### Add Reaction

Add an emoji reaction to a message.

**Configuration:**
- **Connection:** Your Slack connection
- **Channel:** Channel containing the message
- **Message Timestamp:** Timestamp of message
- **Emoji:** Emoji name (without colons)

**Example:**
```
Emoji: white_check_mark
```

---

## Available Triggers

### New Message in Channel

Trigger when a message is posted to a specific channel.

**Configuration:**
- **Connection:** Your Slack connection
- **Channel:** Channel to monitor
- **Bot Messages:** Include or exclude bot messages

**Output:**
- Message text
- User who posted
- Timestamp
- Channel
- Thread information

**Note:** Requires Slack Events API to be configured. Contact support for setup assistance.

---

## Message Formatting

Slack supports rich message formatting using markdown-like syntax.

### Basic Formatting

**Bold:** `*bold text*` → **bold text**  
**Italic:** `_italic text_` → _italic text_  
**Strikethrough:** `~strikethrough~` → ~~strikethrough~~  
**Code:** `` `code` `` → `code`  
**Code block:**
```
```
code block
```
```

### Links

**URL:** `<https://example.com>` → https://example.com  
**Named link:** `<https://example.com|Example>` → Example  
**User mention:** `<@U123456>` → @username  
**Channel mention:** `<#C123456>` → #channel

### Lists

```
• Item 1
• Item 2
• Item 3
```

### Emoji

Use emoji names with colons: `:rocket:` → 🚀

**Common emoji:**
- `:white_check_mark:` → ✅
- `:x:` → ❌
- `:warning:` → ⚠️
- `:fire:` → 🔥
- `:rocket:` → 🚀
- `:tada:` → 🎉

---

## Common Errors & Fixes

### "channel_not_found"

**Cause:** The channel doesn't exist or the bot doesn't have access.

**Solutions:**
1. Verify the channel name is correct
2. Invite the Defense Catalyst bot to the channel:
   - Go to the channel in Slack
   - Type `/invite @Defense Catalyst`
   - Press Enter
3. For private channels, you must invite the bot manually

---

### "not_in_channel"

**Cause:** The bot hasn't been added to the channel.

**Solution:**
1. Go to the channel in Slack
2. Type `/invite @Defense Catalyst`
3. Press Enter
4. Try sending the message again

---

### "invalid_auth"

**Cause:** The Slack connection has expired or been revoked.

**Solutions:**
1. Go to Connections in Defense Catalyst
2. Find your Slack connection
3. Click **"Reconnect"**
4. Authorize again

---

### "rate_limited"

**Cause:** Too many messages sent too quickly.

**Solutions:**
1. Reduce the frequency of messages
2. Add delays between messages
3. Batch messages when possible
4. Check Slack's rate limits: https://api.slack.com/docs/rate-limits

---

### "msg_too_long"

**Cause:** Message exceeds Slack's 40,000 character limit.

**Solutions:**
1. Shorten the message
2. Split into multiple messages
3. Upload long content as a file instead

---

### "no_text"

**Cause:** Message field is empty.

**Solution:**
1. Ensure the message field has content
2. Check that data mapping is correct
3. Verify previous steps produced output

---

## Test Checklist

Use this checklist to verify your Slack integration works correctly:

### Connection
- [ ] Successfully authorized with Slack
- [ ] Connection appears in connections list
- [ ] Can select channels from dropdown

### Sending Messages
- [ ] Can send message to public channel
- [ ] Can send message to private channel (after inviting bot)
- [ ] Message formatting displays correctly
- [ ] Emoji render correctly
- [ ] Links are clickable

### Dynamic Data
- [ ] Can insert data from previous steps
- [ ] Data appears correctly in message
- [ ] Handles empty/null values gracefully

### Error Handling
- [ ] Appropriate error message if channel not found
- [ ] Appropriate error message if not in channel
- [ ] Flow handles errors gracefully

### Performance
- [ ] Messages send within acceptable time (< 5 seconds)
- [ ] No rate limiting errors under normal load

---

## Tips & Best Practices

### Use Descriptive Bot Names

Customize the bot name and icon for different types of messages:

```
Username: Alert Bot
Icon: :warning:
```

```
Username: Deploy Bot
Icon: :rocket:
```

This helps users quickly identify the source and type of message.

---

### Format Messages for Readability

Use formatting to make messages scannable:

```
🚨 *Production Alert*

*Service:* API Gateway
*Status:* Down
*Started:* {{incident.start_time}}
*Impact:* High

<{{incident.url}}|View Incident>
```

---

### Use Threads for Related Messages

Reply to threads to keep channels organized:

```
1. Send initial message
2. Save the message timestamp
3. Send follow-up messages with thread_ts set to the initial timestamp
```

---

### Batch Notifications

Instead of sending many individual messages, batch them:

```
❌ Don't:
- Send message for each error (could be hundreds)

✅ Do:
- Collect errors
- Send one message with summary
- Include count and top errors
```

---

### Handle Rate Limits

Slack has rate limits. Design flows to stay within limits:

- **Tier 1:** 1 message per second per channel
- **Tier 2:** 20 messages per minute per channel
- **Tier 3:** 50 messages per minute per workspace

**Strategies:**
- Add delays between messages
- Use message updates instead of new messages
- Batch multiple updates into one message

---

### Use Slack Blocks for Rich Messages

For advanced formatting, use Slack's Block Kit (requires custom code):

```json
{
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "*Alert*: System down"
      }
    },
    {
      "type": "actions",
      "elements": [
        {
          "type": "button",
          "text": {
            "type": "plain_text",
            "text": "View Details"
          },
          "url": "https://example.com/incident"
        }
      ]
    }
  ]
}
```

---

### Monitor Bot Health

Regularly check that your Slack bot is working:

- Review run history for Slack actions
- Check for authentication errors
- Verify messages are being delivered
- Monitor rate limit warnings

---

### Security Considerations

**Sensitive Data:**
- Don't post sensitive data to public channels
- Use private channels or DMs for confidential information
- Sanitize data before posting

**Access Control:**
- Limit which flows can post to which channels
- Use separate connections for different security levels
- Regularly audit bot permissions

**Compliance:**
- Ensure Slack usage complies with your organization's policies
- Consider data retention requirements
- Document what data is shared via Slack

---

## Advanced Usage

### Conditional Channel Selection

Send to different channels based on conditions:

```
Channel: {{error.severity === 'high' ? '#critical-alerts' : '#general-alerts'}}
```

### Dynamic Message Content

Build messages dynamically based on data:

```
{{#if deployment.success}}
✅ Deployment Successful
{{else}}
❌ Deployment Failed
{{/if}}

Environment: {{deployment.environment}}
Version: {{deployment.version}}
Duration: {{deployment.duration}}
```

### Mention Users Dynamically

Mention users based on data:

```
<@{{user.slack_id}}> Your task is complete: {{task.name}}
```

### Schedule Regular Updates

Use Schedule trigger + Slack action for regular updates:

```
Trigger: Schedule (Every day at 9 AM)
Action 1: Fetch daily metrics
Action 2: Format report
Action 3: Send to Slack #daily-reports
```

---

## Related Documentation

- [Core Concepts: Connections](core-concepts.md#connections--authentication)
- [Troubleshooting: Connection Problems](troubleshooting-hub.md#connectionauth-problems)
- [Build Your First Workflow](first-workflow-tutorial.md)

---

## Need Help?

**Slack API Documentation:** https://api.slack.com/

**Defense Catalyst Support:** help@defensecatalyst.com

**Common Issues:** [Troubleshooting Hub](troubleshooting-hub.md)


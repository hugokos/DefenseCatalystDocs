# Discord Integration

## Overview

The Discord integration allows you to send messages, manage channels, and interact with Discord servers. Perfect for team notifications, bot automation, and community management.

---

## What It Enables

### Common Use Cases

1. **Notifications**: Send alerts to Discord channels
2. **Bot Automation**: Create custom Discord bot workflows
3. **Community Management**: Automate moderation and welcome messages
4. **Status Updates**: Post system status to Discord
5. **Data Collection**: Gather feedback from Discord users
6. **Cross-Platform Integration**: Connect Discord with other tools

---

## Prerequisites

- Discord account
- Discord server (guild) where you have permissions
- For bot features: Discord bot token
- For webhooks: Webhook URL from Discord channel

---

## Connection Methods

### Method 1: Webhook (Easiest)

**Best for**: Simple message sending

**Pros**:
- No bot required
- Quick setup
- No permissions needed

**Cons**:
- Can only send messages
- Limited to one channel per webhook

### Method 2: Bot Token (Advanced)

**Best for**: Full Discord API access

**Pros**:
- Full API capabilities
- Multiple channels
- Read messages
- Manage server

**Cons**:
- Requires bot creation
- Need server permissions
- More complex setup

---

## How to Connect (Webhook Method)

### Step 1: Create Discord Webhook

1. Open Discord
2. Go to your server
3. Right-click the channel
4. Select "Edit Channel"
5. Click "Integrations"
6. Click "Create Webhook"
7. Name your webhook (e.g., "Defense Catalyst")
8. Copy webhook URL

### Step 2: Add Discord Action

1. In your flow, click "Add Step"
2. Search for "Discord"
3. Select "Send Message to Webhook"
4. Paste webhook URL

### Step 3: Configure Message

**Webhook URL**: Paste from Discord
```
https://discord.com/api/webhooks/123456789/abcdefg...
```

**Message Content**: Your message
```
New deployment completed successfully! 🚀
```

**Username** (optional): Override webhook name
```
Defense Catalyst Bot
```

**Avatar URL** (optional): Override webhook avatar
```
https://example.com/avatar.png
```

### Step 4: Test Message

1. Click "Test Step"
2. Check Discord channel for message
3. Verify formatting and content

---

## How to Connect (Bot Method)

### Step 1: Create Discord Bot

1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Click "New Application"
3. Name your application
4. Go to "Bot" section
5. Click "Add Bot"
6. Copy bot token (keep secret!)

### Step 2: Configure Bot Permissions

1. Go to "OAuth2" → "URL Generator"
2. Select scopes:
   - `bot`
3. Select bot permissions:
   - Send Messages
   - Read Messages
   - Manage Messages (if needed)
   - Embed Links
   - Attach Files
4. Copy generated URL

### Step 3: Invite Bot to Server

1. Paste URL in browser
2. Select your server
3. Authorize bot
4. Complete captcha

### Step 4: Add Discord Connection

1. In Defense Catalyst, add Discord action
2. Click "New Connection"
3. Select "Bot Token" method
4. Paste bot token
5. Test connection

---

## Available Actions

### Send Message to Webhook

**Description**: Send message using webhook URL

**Configuration**:
- **Webhook URL**: Discord webhook URL (required)
- **Content**: Message text (required)
- **Username**: Override webhook name (optional)
- **Avatar URL**: Override webhook avatar (optional)
- **Embeds**: Rich embed objects (optional)

**Example**:
```
Webhook URL: https://discord.com/api/webhooks/...
Content: Deployment completed!
Username: Deploy Bot
```

---

### Send Message to Channel (Bot)

**Description**: Send message using bot token

**Configuration**:
- **Channel ID**: Discord channel ID (required)
- **Content**: Message text (required)
- **Embeds**: Rich embed objects (optional)
- **Files**: File attachments (optional)

**Example**:
```
Channel ID: 123456789012345678
Content: Hello from Defense Catalyst!
```

**Finding Channel ID**:
1. Enable Developer Mode in Discord (Settings → Advanced)
2. Right-click channel
3. Click "Copy ID"

---

### Send Embed Message

**Description**: Send rich formatted message

**Configuration**:
- **Webhook URL** or **Channel ID**
- **Embed Object**: Rich formatting

**Example Embed**:
```json
{
  "title": "Deployment Status",
  "description": "Production deployment completed",
  "color": 3066993,
  "fields": [
    {
      "name": "Version",
      "value": "v1.2.3",
      "inline": true
    },
    {
      "name": "Duration",
      "value": "5 minutes",
      "inline": true
    }
  ],
  "timestamp": "{{now}}",
  "footer": {
    "text": "Defense Catalyst"
  }
}
```

---

### Create Channel (Bot)

**Description**: Create new channel in server

**Configuration**:
- **Server ID**: Discord server ID
- **Channel Name**: Name for new channel
- **Channel Type**: Text, Voice, Category, etc.

---

### Add Role to Member (Bot)

**Description**: Assign role to server member

**Configuration**:
- **Server ID**: Discord server ID
- **User ID**: Discord user ID
- **Role ID**: Role to assign

---

## Common Errors & Fixes

### ❌ "Invalid Webhook URL"

**Cause**: Webhook URL is incorrect or expired

**Fix**:
1. Verify webhook URL is complete
2. Check webhook wasn't deleted in Discord
3. Create new webhook if needed
4. Ensure URL starts with `https://discord.com/api/webhooks/`

---

### ❌ "Missing Permissions"

**Cause**: Bot lacks required permissions

**Fix**:
1. Check bot role in server settings
2. Verify bot has "Send Messages" permission
3. Check channel-specific permissions
4. Move bot role higher in role hierarchy
5. Re-invite bot with correct permissions

---

### ❌ "Unknown Channel"

**Cause**: Channel ID is invalid or bot can't access it

**Fix**:
1. Verify channel ID is correct
2. Ensure bot is in the server
3. Check bot can see the channel
4. Verify channel wasn't deleted
5. Check channel permissions

---

### ❌ "Rate Limited"

**Cause**: Too many messages sent too quickly

**Fix**:
1. Slow down message frequency
2. Discord limits: 5 messages per 5 seconds per channel
3. Add delays between messages
4. Use batch operations when possible
5. Monitor rate limit headers

---

### ❌ "Invalid Form Body"

**Cause**: Message content is invalid

**Fix**:
1. Check message isn't empty
2. Verify embed JSON is valid
3. Check content length (max 2000 characters)
4. Verify embed limits:
   - Title: 256 characters
   - Description: 4096 characters
   - Fields: 25 max
   - Field name: 256 characters
   - Field value: 1024 characters

---

## Test Checklist

- [ ] Webhook URL or bot token is valid
- [ ] Bot is in the server (for bot method)
- [ ] Bot has required permissions
- [ ] Channel ID is correct
- [ ] Message sends successfully
- [ ] Formatting appears correctly
- [ ] Embeds render properly (if used)
- [ ] Rate limits are respected

---

## Tips & Best Practices

### Message Formatting

**Bold**: `**bold text**`
**Italic**: `*italic text*`
**Underline**: `__underline__`
**Strikethrough**: `~~strikethrough~~`
**Code**: `` `code` ``
**Code Block**:
```
```language
code block
```
```

**Mentions**:
- User: `<@USER_ID>`
- Channel: `<#CHANNEL_ID>`
- Role: `<@&ROLE_ID>`

**Emojis**:
- Unicode: 🚀 ✅ ❌
- Custom: `<:name:ID>`

### Embed Best Practices

1. **Use Colors**: Make embeds visually distinct
   - Success: 3066993 (green)
   - Warning: 16776960 (yellow)
   - Error: 15158332 (red)
   - Info: 3447003 (blue)

2. **Keep It Concise**: Don't overwhelm with information
3. **Use Fields**: Organize data in fields
4. **Add Timestamps**: Show when event occurred
5. **Include Footer**: Add context or branding

### Performance Tips

1. **Batch Messages**: Combine multiple updates into one message
2. **Use Webhooks**: Faster than bot API for simple messages
3. **Cache Channel IDs**: Don't look up IDs repeatedly
4. **Respect Rate Limits**: Add delays between messages
5. **Use Embeds**: More information in less space

### Security Tips

1. **Keep Tokens Secret**: Never expose bot tokens
2. **Use Webhooks for Public**: Webhooks are safer for public flows
3. **Limit Permissions**: Only grant necessary bot permissions
4. **Rotate Tokens**: Change bot tokens periodically
5. **Monitor Usage**: Watch for unauthorized access

---

## Advanced Patterns

### Status Dashboard

```
1. Schedule Trigger (every 5 minutes)
2. HTTP Request: Check service health
3. Branch: Based on status
4. Discord: Send embed with status
   - Green for healthy
   - Red for down
   - Yellow for degraded
```

### Alert Aggregation

```
1. Webhook Trigger: Receive alerts
2. Storage: Add to temporary list
3. Schedule Trigger: Every 15 minutes
4. Discord: Send summary of all alerts
5. Storage: Clear list
```

### Interactive Bot

```
1. Discord: Listen for messages (webhook)
2. Branch: Parse command
3. Execute appropriate action
4. Discord: Send response
```

---

## Example Messages

### Simple Notification

```
Content: ✅ Deployment to production completed successfully!
```

### Rich Embed

```json
{
  "title": "🚀 Deployment Complete",
  "description": "Production deployment finished successfully",
  "color": 3066993,
  "fields": [
    {
      "name": "Environment",
      "value": "Production",
      "inline": true
    },
    {
      "name": "Version",
      "value": "v1.2.3",
      "inline": true
    },
    {
      "name": "Duration",
      "value": "5m 23s",
      "inline": true
    },
    {
      "name": "Changes",
      "value": "• Fixed login bug\n• Updated dependencies\n• Performance improvements"
    }
  ],
  "timestamp": "2025-01-18T10:30:00Z",
  "footer": {
    "text": "Defense Catalyst CI/CD"
  }
}
```

### Error Alert

```json
{
  "title": "❌ Error Detected",
  "description": "Critical error in production",
  "color": 15158332,
  "fields": [
    {
      "name": "Service",
      "value": "API Server",
      "inline": true
    },
    {
      "name": "Severity",
      "value": "Critical",
      "inline": true
    },
    {
      "name": "Error",
      "value": "Database connection failed"
    },
    {
      "name": "Action Required",
      "value": "Check database server status"
    }
  ],
  "timestamp": "2025-01-18T10:30:00Z"
}
```

---

## Limitations

- **Message Length**: 2000 characters max
- **Embed Limits**: See error section above
- **Rate Limits**: 5 messages per 5 seconds per channel
- **File Size**: 8 MB max (or server boost limit)
- **Webhooks**: Can only send messages, not read

---

## Related Documentation

- [Core Concepts: Actions](04-core-concepts.md#triggers-vs-actions)
- [Slack Integration](06-integration-slack.md) (similar patterns)
- [Troubleshooting: Rate Limits](07-troubleshooting-hub.md#rate-limits--timeouts)
- [Error Reference](08-error-reference.md)

---

## Need Help?

- **Discord API Docs**: [discord.com/developers/docs](https://discord.com/developers/docs)
- **Embed Visualizer**: [leovoel.github.io/embed-visualizer](https://leovoel.github.io/embed-visualizer/)
- **Color Picker**: [spycolor.com](https://www.spycolor.com)
- **Support**: [Contact Support](13-contact-support.md) with webhook URL (safe to share) or error message

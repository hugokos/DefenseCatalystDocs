# Integrations Directory

Defense Catalyst supports 280+ integrations with popular apps, services, and APIs. This directory helps you find and connect the tools you need.

---

## How to Use This Directory

1. **Browse by category** to find integrations in your area of interest
2. **Check authentication type** to understand how you'll connect
3. **Review common use cases** to see what's possible
4. **Click the integration name** to see detailed setup instructions

---

## Integration Categories

### Communication

Connect messaging and communication platforms.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **Slack** | Send messages, manage channels, post updates | OAuth | [Setup Guide](integration-slack.md) |
| **Discord** | Send messages, manage servers, post notifications | OAuth / Bot Token | [Setup Guide](integration-discord.md) |
| **Microsoft Teams** | Post messages, manage teams, send notifications | OAuth | Coming Soon |
| **Email (SMTP)** | Send emails via any SMTP server | Username/Password | [Setup Guide](integration-email.md) |
| **Gmail** | Send and receive emails, manage labels | OAuth | Coming Soon |
| **Outlook** | Send and receive emails, manage folders | OAuth | Coming Soon |
| **Twilio** | Send SMS, make calls, manage phone numbers | API Key | Coming Soon |

**Common use cases:**
- Send alerts and notifications
- Post updates to team channels
- Automate email responses
- Broadcast announcements

---

### Data & Databases

Work with spreadsheets, databases, and data storage.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **Google Sheets** | Read and write spreadsheet data | OAuth | [Setup Guide](integration-google-sheets.md) |
| **Airtable** | Manage records in bases and tables | API Key | Coming Soon |
| **PostgreSQL** | Query and update PostgreSQL databases | Username/Password | [Setup Guide](integration-postgresql.md) |
| **MySQL** | Query and update MySQL databases | Username/Password | Coming Soon |
| **MongoDB** | Work with MongoDB collections | Connection String | Coming Soon |
| **Redis** | Cache data, manage key-value store | Connection String | Coming Soon |
| **Google Drive** | Upload, download, and manage files | OAuth | Coming Soon |
| **Dropbox** | Upload, download, and manage files | OAuth | Coming Soon |
| **AWS S3** | Store and retrieve files from S3 buckets | API Key | Coming Soon |

**Common use cases:**
- Sync data between systems
- Generate reports from databases
- Backup data to cloud storage
- Aggregate data from multiple sources

---

### AI & Machine Learning

Integrate AI capabilities into your workflows.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **OpenAI** | GPT models, embeddings, image generation | API Key | [Setup Guide](integration-openai.md) |
| **Anthropic** | Claude models for advanced reasoning | API Key | Coming Soon |
| **Hugging Face** | Access thousands of AI models | API Key | Coming Soon |
| **Google AI** | Gemini models and AI services | API Key | Coming Soon |
| **Cohere** | Language models and embeddings | API Key | Coming Soon |

**Common use cases:**
- Generate content and summaries
- Analyze text and sentiment
- Create embeddings for search
- Classify and categorize data
- Generate images from text

---

### Development & DevOps

Automate development workflows and CI/CD pipelines.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **GitHub** | Manage repos, issues, PRs, and actions | OAuth / Token | [Setup Guide](integration-github.md) |
| **GitLab** | Manage projects, issues, and merge requests | OAuth / Token | Coming Soon |
| **Jira** | Create and update issues and projects | OAuth / API Key | Coming Soon |
| **Jenkins** | Trigger builds and monitor jobs | API Key | Coming Soon |
| **Docker Hub** | Manage images and repositories | API Key | Coming Soon |
| **AWS** | Interact with AWS services | API Key | Coming Soon |
| **Azure** | Interact with Azure services | OAuth | Coming Soon |
| **Google Cloud** | Interact with GCP services | OAuth | Coming Soon |

**Common use cases:**
- Automate issue creation
- Trigger CI/CD pipelines
- Monitor build status
- Deploy applications
- Manage infrastructure

---

### Productivity & Collaboration

Enhance team productivity and collaboration.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **Google Calendar** | Create and manage calendar events | OAuth | Coming Soon |
| **Microsoft Calendar** | Create and manage calendar events | OAuth | Coming Soon |
| **Notion** | Create and update pages and databases | OAuth / API Key | Coming Soon |
| **Trello** | Manage boards, lists, and cards | OAuth / API Key | Coming Soon |
| **Asana** | Create and update tasks and projects | OAuth / API Key | Coming Soon |
| **Monday.com** | Manage boards and items | API Key | Coming Soon |

**Common use cases:**
- Schedule meetings automatically
- Create tasks from emails
- Sync project status
- Generate reports
- Automate workflows

---

### Marketing & CRM

Connect marketing tools and customer relationship management systems.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **HubSpot** | Manage contacts, deals, and campaigns | OAuth / API Key | Coming Soon |
| **Salesforce** | Manage leads, opportunities, and accounts | OAuth | Coming Soon |
| **Mailchimp** | Manage email campaigns and subscribers | OAuth / API Key | Coming Soon |
| **SendGrid** | Send transactional and marketing emails | API Key | Coming Soon |
| **Stripe** | Process payments and manage subscriptions | API Key | Coming Soon |
| **Shopify** | Manage products, orders, and customers | OAuth / API Key | Coming Soon |

**Common use cases:**
- Sync customer data
- Automate email campaigns
- Track sales pipeline
- Process orders
- Generate invoices

---

### Utilities & Core

Essential utilities and core functionality.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **Webhook** | Receive HTTP requests to trigger flows | None | [Setup Guide](integration-webhook.md) |
| **Schedule** | Run flows on a timer or cron schedule | None | [Setup Guide](integration-schedule.md) |
| **HTTP Request** | Make HTTP/REST API calls | Various | [Setup Guide](integration-http.md) |
| **Code** | Execute custom JavaScript/TypeScript code | None | Coming Soon |
| **Delay** | Wait for a specified time before continuing | None | Coming Soon |
| **Conditional** | Branch flow based on conditions | None | Coming Soon |
| **Loop** | Iterate over arrays and collections | None | Coming Soon |

**Common use cases:**
- Integrate with any REST API
- Add custom logic
- Control flow execution
- Transform data
- Schedule tasks

---

### Defense & Government

Specialized integrations for defense and government operations.

| Integration | Description | Auth Type | Setup Guide |
|------------|-------------|-----------|-------------|
| **DoD Systems** | Connect to Department of Defense systems | Custom | Contact Support |
| **Classified Data Handler** | Secure handling of classified information | Custom | Contact Support |
| **Government APIs** | Access government data and services | API Key | Contact Support |
| **Defense Contractor Tools** | Integrate with defense contractor platforms | Various | Contact Support |

**Common use cases:**
- Automate defense workflows
- Integrate classified systems
- Comply with DoD standards
- Secure data handling
- Mission-critical operations

**Note:** These integrations require special configuration and security clearances. Contact help@defensecatalyst.com for access.

---

## Integration Details

### Authentication Types Explained

**OAuth (Recommended)**
- Most secure method
- Click to authorize through the service's official login
- Easy to revoke access
- No need to share passwords

**API Key**
- Generate a key in the service's settings
- Paste the key into Defense Catalyst
- Rotate keys regularly for security

**Username & Password**
- Basic authentication
- Use only with trusted services
- Credentials are encrypted

**Custom**
- Advanced authentication for specialized systems
- May require certificates, tokens, or custom headers
- Contact support for assistance

---

### Common Limitations

Most integrations have some limitations to be aware of:

**Rate Limits**
- APIs limit how many requests you can make per minute/hour
- Defense Catalyst automatically handles rate limiting
- Slow down polling intervals if you hit limits

**Data Size Limits**
- Maximum request/response size varies by service
- Typically 1-10 MB per request
- Use pagination for large datasets

**Permissions**
- You need appropriate permissions in the connected service
- Some actions require admin access
- Review required scopes during OAuth

**Availability**
- External services may have downtime
- Defense Catalyst automatically retries transient failures
- Check service status pages if issues persist

---

## Finding the Right Integration

### By Use Case

**Need to send notifications?**
→ Slack, Discord, Email, Teams

**Need to store data?**
→ Google Sheets, Airtable, PostgreSQL, S3

**Need to use AI?**
→ OpenAI, Anthropic, Hugging Face

**Need to automate development?**
→ GitHub, GitLab, Jira, Jenkins

**Need to integrate any API?**
→ HTTP Request, Webhook

### By Trigger Type

**Real-time triggers (instant):**
- Webhook
- App events (Slack, GitHub, etc.)

**Scheduled triggers:**
- Schedule (cron)
- Polling triggers (check periodically)

### By Authentication

**No authentication needed:**
- Webhook
- Schedule
- Code

**OAuth (easiest):**
- Google services
- Microsoft services
- Slack, GitHub, GitLab

**API Key:**
- OpenAI, Anthropic
- Many REST APIs
- Custom services

---

## Integration Setup Process

For each integration, follow this general process:

### 1. Review Prerequisites
- Check what you need (account, permissions, API key)
- Ensure you have necessary access
- Review any special requirements

### 2. Create Connection
- Navigate to the integration in Defense Catalyst
- Click "New Connection"
- Follow the authentication flow
- Test the connection

### 3. Configure Trigger or Action
- Add the integration to your flow
- Select the specific trigger or action
- Configure required fields
- Map data from previous steps

### 4. Test
- Run a test execution
- Verify the integration works correctly
- Check output data
- Fix any issues

### 5. Monitor
- Check run history after publishing
- Watch for errors or failures
- Update connection if needed

---

## Need Help?

### Integration Not Listed?

Defense Catalyst supports 280+ integrations. If you don't see what you need:

1. **Use HTTP Request** - Most services have REST APIs you can call directly
2. **Request an integration** - Email help@defensecatalyst.com with your request
3. **Build a custom piece** - Advanced users can create custom integrations

### Setup Issues?

- Check the integration's setup guide (linked above)
- Review the [Troubleshooting Hub](troubleshooting-hub.md)
- Check the service's status page
- Contact support at help@defensecatalyst.com

### Security Questions?

- Review [Security & Privacy](security-privacy.md)
- Check the service's security documentation
- Contact support for defense-specific requirements

---

## Popular Integration Combinations

### Webhook → Slack
Receive data from external systems and notify your team.

### Schedule → Database → Email
Generate daily reports and email them to stakeholders.

### GitHub → Jira → Slack
Automatically create tickets from issues and notify the team.

### Google Sheets → OpenAI → Sheets
Process spreadsheet data with AI and write results back.

### HTTP Request → Transform → Database
Fetch data from APIs, transform it, and store in your database.

---

**Ready to connect?** Choose an integration above and follow the setup guide.

**Need more details?** Check out our [Core Concepts](core-concepts.md) guide.

**Have questions?** Contact help@defensecatalyst.com


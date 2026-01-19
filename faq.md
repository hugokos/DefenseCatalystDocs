# Frequently Asked Questions (FAQ)

Quick answers to common questions about Defense Catalyst.

---

## Getting Started

### What is Defense Catalyst?

Defense Catalyst is an AI-powered workflow automation platform optimized for defense technology and DoD use cases. It allows you to connect apps, automate tasks, and build workflows without coding.

### Do I need to know how to code?

No! Defense Catalyst is designed for non-technical users. The visual flow builder lets you create workflows by dragging and dropping. However, if you do know how to code, you can use custom code steps for advanced scenarios.

### How is Defense Catalyst different from Zapier or Make?

Defense Catalyst is:
- **Self-hosted**: Your data stays on your infrastructure
- **Defense-focused**: Optimized for DoD compliance and security
- **Open-source based**: Built on Activepieces with defense enhancements
- **AI-powered**: Includes AI Copilot for flow building assistance
- **Air-gap capable**: Can run in isolated networks

### How do I get started?

1. Read the [Getting Started Guide](02-getting-started.md)
2. Follow the [Build Your First Workflow Tutorial](03-first-workflow-tutorial.md)
3. Explore the [Integrations Directory](05-integrations-directory.md)
4. Check out example workflows in your workspace

### Is there a free trial?

Contact your Defense Catalyst administrator for access to your organization's workspace.

---

## Flows & Workflows

### What's the difference between a flow and a workflow?

They're the same thing! We use both terms interchangeably. A flow/workflow is an automation that connects a trigger with one or more actions.

### How many flows can I create?

This depends on your workspace plan. Check with your administrator for specific limits.

### Can I copy a flow?

Yes! In the flow list, click the three-dot menu next to a flow and select "Duplicate". This creates a copy you can modify.

### Can I share flows with my team?

Yes! All flows in a workspace are accessible to team members based on their role (Admin, Editor, or Viewer).

### What happens if I delete a flow?

Deleted flows are moved to trash and can be restored within 30 days. After 30 days, they're permanently deleted.

### Can I export/import flows?

Yes! You can export flows as JSON files and import them into other workspaces. This is useful for moving flows between environments.

---

## Triggers

### What's the difference between a trigger and an action?

- **Trigger**: Starts your flow (e.g., when a webhook is received, on a schedule)
- **Action**: Does something (e.g., send an email, create a record)

Every flow has exactly one trigger and one or more actions.

### Can a flow have multiple triggers?

No, each flow has exactly one trigger. If you need multiple triggers, create separate flows or use a webhook trigger with multiple sources.

### How often do polling triggers check for new data?

This depends on your plan and the specific integration. Common intervals are:
- Every 1 minute (premium)
- Every 5 minutes (standard)
- Every 15 minutes (basic)

### Why isn't my webhook trigger firing?

Common causes:
1. Flow is not published (still in draft mode)
2. Webhook URL is incorrect
3. External service isn't sending webhooks
4. Webhook signature validation is failing

See [Troubleshooting: Workflow Won't Trigger](07-troubleshooting-hub.md#my-workflow-wont-trigger)

---

## Actions & Integrations

### How many integrations does Defense Catalyst support?

Defense Catalyst supports 280+ integrations including Slack, Google Sheets, GitHub, OpenAI, and many more. See the [Integrations Directory](05-integrations-directory.md) for the full list.

### Can I request a new integration?

Yes! Contact your administrator or [submit a request](13-contact-support.md) with details about the integration you need.

### How do I connect an app?

1. Add an action for that app in your flow
2. Click "New Connection"
3. Follow the authentication steps (OAuth, API key, etc.)
4. Test the connection
5. Save and reuse across flows

### Can I use the same connection in multiple flows?

Yes! Connections are workspace-level and can be reused across all flows.

### What if my connection expires?

Some connections (especially OAuth) expire after a period. You'll need to reconnect:
1. Go to Connections in your workspace
2. Find the expired connection
3. Click "Reconnect"
4. Re-authorize the app

---

## Data & Mapping

### How do I use data from previous steps?

Use the data picker (lightning bolt icon) to select data from previous steps. You can also type `{{stepName.fieldName}}` directly.

### What if the data I need isn't available?

Common causes:
1. Previous step hasn't run yet (test the flow)
2. Previous step failed
3. Data structure is different than expected
4. Field name has changed

See [Troubleshooting: Data Mapping Issues](07-troubleshooting-hub.md#my-data-mapping-is-emptywrong)

### Can I transform data?

Yes! Use:
- **Text operations**: Concatenate, split, replace, format
- **Date operations**: Format, add/subtract time, convert timezones
- **JSON operations**: Parse, stringify, extract values
- **Array operations**: Filter, map, reduce, sort
- **Code step**: Write custom JavaScript for complex transformations

### How do I handle arrays/lists?

Use the Loop action to process each item in an array individually. You can also use array operations to filter, map, or transform the entire array at once.

---

## Runs & Debugging

### Where can I see my flow runs?

Click on a flow, then go to the "Runs" tab. You'll see a history of all executions with status, timestamp, and duration.

### What do the different run statuses mean?

- **Running**: Currently executing
- **Succeeded**: Completed successfully
- **Failed**: Encountered an error
- **Stopped**: Manually stopped by user

### How long is run history kept?

Run history is retained for 30-90 days depending on your plan. Check with your administrator for specific retention periods.

### Can I manually trigger a flow?

Yes! Click the "Test" button in the flow builder to run the flow immediately with test data.

### Can I retry a failed run?

Yes! In the run details, click "Retry" to execute the flow again with the same input data.

### Why did my flow fail?

Check the run details to see which step failed and the error message. Common causes:
- Connection expired or invalid
- Invalid data format
- API rate limit exceeded
- Timeout
- Missing required fields

See [Troubleshooting: Run Failed](07-troubleshooting-hub.md#my-run-failed)

---

## Performance & Limits

### How long can a flow run?

Maximum execution time is typically 5-10 minutes per run, depending on your plan. If you need longer, consider breaking the flow into smaller flows.

### Are there rate limits?

Yes, both Defense Catalyst and external APIs have rate limits:
- **Defense Catalyst**: Varies by plan
- **External APIs**: Varies by service (check integration docs)

See [Limits & Reliability](10-limits-reliability.md)

### Can flows run in parallel?

Yes! Multiple flows can run simultaneously. You can also use branches within a flow to execute actions in parallel.

### How many steps can a flow have?

Most plans allow 50-100 steps per flow. For complex workflows, consider breaking them into multiple flows connected by webhooks.

---

## Security & Privacy

### Is my data secure?

Yes! Defense Catalyst:
- Encrypts data at rest and in transit
- Stores credentials securely
- Supports air-gapped deployments
- Follows DoD security standards
- Provides audit logging

See [Security & Privacy](11-security-privacy.md)

### Who can see my flows?

Only members of your workspace can see flows, based on their role:
- **Admin**: Full access to all flows
- **Editor**: Can create and edit flows
- **Viewer**: Can view flows but not edit

### Where is my data stored?

Defense Catalyst is self-hosted on your infrastructure. Your data never leaves your environment.

### Can I use Defense Catalyst in an air-gapped environment?

Yes! Defense Catalyst supports air-gapped deployments for classified or isolated networks. Contact your administrator for setup details.

### How are API keys and passwords stored?

Credentials are encrypted at rest using industry-standard encryption. They're never exposed in logs or run history.

---

## AI Copilot

### What is AI Copilot?

AI Copilot is a ChatGPT-style assistant that helps you build flows. It can:
- Suggest flow structures
- Help with data mapping
- Explain errors
- Recommend integrations
- Generate flow modifications

### How do I access Copilot?

Click the "Copilot" button in the flow builder (if enabled for your workspace).

### Is Copilot always available?

Copilot availability depends on your workspace configuration. Contact your administrator if you don't see the Copilot button.

### What data does Copilot see?

Copilot sees:
- Your flow structure
- Step configurations
- Validation errors
- Available integrations

Copilot does NOT see:
- Your actual data
- API keys or credentials
- Run history details
- Personal information

### Can Copilot build flows for me?

Copilot can suggest flow structures and modifications, but you maintain full control. Review all suggestions before applying them.

---

## Billing & Plans

### How is Defense Catalyst priced?

Contact your organization's administrator for pricing information. Defense Catalyst is typically licensed at the organization level.

### What's included in my plan?

Plan features vary by organization. Common features include:
- Number of flows
- Number of runs per month
- Run history retention
- Number of team members
- Support level
- Advanced features (AI Copilot, etc.)

### Can I upgrade my plan?

Contact your administrator to discuss plan upgrades.

---

## Troubleshooting

### My flow isn't working. What should I do?

1. Check if the flow is published (not draft)
2. Check if the flow is enabled
3. Review recent run history for errors
4. Test each step individually
5. Check connection status
6. Review the [Troubleshooting Hub](07-troubleshooting-hub.md)

### Where can I find error codes?

See the [Error Reference](08-error-reference.md) for a complete list of error codes and their meanings.

### How do I debug a complex flow?

1. Test each step individually
2. Use the run history to see step-by-step execution
3. Add logging steps to track data flow
4. Simplify the flow to isolate the issue
5. Check the [Debugging Guide](09-runs-logs-debugging.md)

### Can I get help from support?

Yes! See [Contact Support](13-contact-support.md) for how to reach our support team.

---

## Advanced Features

### Can I use custom code?

Yes! Use the Code step to write custom JavaScript or TypeScript. You have access to NPM packages and can perform complex data transformations.

### Can I call my own APIs?

Yes! Use the HTTP Request action to call any API endpoint. See [HTTP Request Integration](06-integration-http.md).

### Can I use databases?

Yes! Defense Catalyst supports:
- PostgreSQL
- MySQL
- MongoDB
- Microsoft SQL Server
- And more...

See [PostgreSQL Integration](06-integration-postgresql.md) for an example.

### Can I schedule flows?

Yes! Use the Schedule trigger with cron expressions to run flows at specific times or intervals. See [Schedule Integration](06-integration-schedule.md).

### Can I create reusable sub-flows?

Not directly, but you can:
1. Create a flow with a webhook trigger
2. Call it from other flows using HTTP Request
3. Pass data via the webhook payload

---

## Migration & Integration

### Can I migrate from Zapier/Make?

Yes! While there's no automatic migration tool, you can:
1. Export your workflows from the other platform
2. Recreate them in Defense Catalyst
3. Use similar integrations and logic
4. Test thoroughly before switching

### Can Defense Catalyst integrate with our internal systems?

Yes! Use:
- HTTP Request for REST APIs
- Database integrations for direct database access
- Custom pieces for specialized integrations
- Webhooks for event-driven integration

### Can I use Defense Catalyst with our CI/CD pipeline?

Yes! Common patterns:
- Trigger flows from CI/CD via webhooks
- Call APIs from flows to trigger deployments
- Send notifications to Slack/Discord
- Update databases with deployment info

---

## Getting Help

### Where can I find documentation?

- [Getting Started](02-getting-started.md)
- [Core Concepts](04-core-concepts.md)
- [Integrations Directory](05-integrations-directory.md)
- [Troubleshooting Hub](07-troubleshooting-hub.md)
- [All Documentation](01-home.md)

### How do I contact support?

See [Contact Support](13-contact-support.md) for support options and what information to include in your request.

### Is there a community forum?

Check with your administrator for internal community resources or forums.

### Can I request new features?

Yes! Contact your administrator or [submit a feature request](13-contact-support.md) with details about what you need.

---

## Still Have Questions?

If your question isn't answered here:
1. Search the [documentation](01-home.md)
2. Check the [Troubleshooting Hub](07-troubleshooting-hub.md)
3. [Contact Support](13-contact-support.md)

We're here to help! 🚀

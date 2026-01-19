# GitHub Integration

## What It Enables

Automate your development workflow by connecting Defense Catalyst to GitHub:

- **Issue Management**: Create, update, and track issues automatically
- **Pull Request Automation**: Trigger workflows on PR events
- **Release Notifications**: Alert teams about new releases
- **Repository Management**: Create repos, manage branches
- **CI/CD Integration**: Trigger builds and deployments
- **Team Notifications**: Send updates to Slack/email on GitHub events

## Prerequisites

- GitHub account (personal or organization)
- Repository access (read/write permissions as needed)
- Admin access for organization-level integrations

## How to Connect

### Step 1: Add GitHub Action

1. In your flow, click "+" to add a step
2. Search for "GitHub"
3. Select the action you want (e.g., "Create Issue")

### Step 2: Authenticate with GitHub

1. Click "Connect" or "+ New Connection"
2. Click "Sign in with GitHub"
3. Review permissions requested:
   - Read repository data
   - Write repository data (if needed)
   - Manage issues and pull requests
4. Click "Authorize"

### Step 3: Configure Action

1. Select organization (if applicable)
2. Select repository
3. Configure action-specific settings
4. Map data from previous steps

### Step 4: Test Connection

1. Click "Test" to verify connection
2. Check GitHub for results
3. Verify action completed successfully

## Available Triggers

### New Issue
**When**: A new issue is created in repository
**Use Cases**:
- Notify team in Slack
- Create task in project management tool
- Auto-label based on content

**Configuration**:
- Repository
- Polling interval

### New Pull Request
**When**: A new PR is opened
**Use Cases**:
- Notify reviewers
- Run additional checks
- Update project board

**Configuration**:
- Repository
- Branch filter (optional)

### New Release
**When**: A new release is published
**Use Cases**:
- Send release notes to team
- Trigger deployment
- Update documentation

**Configuration**:
- Repository
- Include pre-releases (optional)

### New Star
**When**: Repository receives a star
**Use Cases**:
- Track popularity
- Thank contributors
- Analytics

**Configuration**:
- Repository

### Push to Branch
**When**: Code is pushed to specific branch
**Use Cases**:
- Trigger CI/CD
- Notify team
- Run tests

**Configuration**:
- Repository
- Branch name

## Available Actions

### Create Issue
**What**: Creates a new issue in repository
**Required Fields**:
- Repository
- Title
- Body (optional)

**Optional Fields**:
- Labels
- Assignees
- Milestone

**Example**:
```
Title: Bug Report: {{trigger.error_type}}
Body: 
Error occurred at {{trigger.timestamp}}
Details: {{trigger.error_message}}

Steps to reproduce:
{{trigger.steps}}
```

### Update Issue
**What**: Updates an existing issue
**Required Fields**:
- Repository
- Issue number
- Fields to update

**Use Cases**:
- Add labels
- Change status
- Update description
- Assign to user

### Close Issue
**What**: Closes an issue with optional comment
**Required Fields**:
- Repository
- Issue number

**Optional**:
- Closing comment

### Create Pull Request
**What**: Creates a new pull request
**Required Fields**:
- Repository
- Title
- Head branch (source)
- Base branch (target)

**Optional**:
- Body
- Reviewers
- Labels

### Merge Pull Request
**What**: Merges an approved pull request
**Required Fields**:
- Repository
- PR number
- Merge method (merge, squash, rebase)

**Warning**: Ensure PR is approved before merging!

### Add Comment
**What**: Adds comment to issue or PR
**Required Fields**:
- Repository
- Issue/PR number
- Comment body

**Use Cases**:
- Bot responses
- Status updates
- Automated feedback

### Create Branch
**What**: Creates a new branch
**Required Fields**:
- Repository
- Branch name
- Source branch

**Use Cases**:
- Automated feature branches
- Release branches
- Hotfix branches

### Create Release
**What**: Creates a new release
**Required Fields**:
- Repository
- Tag name
- Release name

**Optional**:
- Body (release notes)
- Pre-release flag
- Draft flag

### Get File Content
**What**: Retrieves file content from repository
**Required Fields**:
- Repository
- File path
- Branch (optional, defaults to default branch)

**Returns**: File content as text

### Create/Update File
**What**: Creates new file or updates existing
**Required Fields**:
- Repository
- File path
- Content
- Commit message

**Use Cases**:
- Update documentation
- Modify configuration
- Automated code changes

## Common Errors & Fixes

### "Not Found" or "Repository not found"
**Cause**: Repository doesn't exist or no access
**Fix**:
1. Verify repository name is correct (owner/repo)
2. Check you have access to repository
3. For private repos, ensure OAuth app has access
4. Reconnect GitHub integration

### "Resource not accessible by integration"
**Cause**: Insufficient permissions
**Fix**:
1. Check required permissions for action
2. Reconnect with broader permissions
3. For organizations, check app installation settings
4. Verify you're not using fine-grained token with limited scope

### "Validation Failed"
**Cause**: Invalid data in request
**Fix**:
1. Check required fields are provided
2. Verify issue/PR numbers are correct
3. Ensure labels exist in repository
4. Check assignees are valid users

### "Reference already exists"
**Cause**: Branch or tag name already exists
**Fix**:
1. Use unique branch/tag names
2. Check existing branches before creating
3. Delete old branch if appropriate
4. Use timestamp in name for uniqueness

### "Rate limit exceeded"
**Cause**: Too many API requests
**Fix**:
1. Reduce flow execution frequency
2. Check GitHub rate limits (5000/hour authenticated)
3. Implement caching where possible
4. Add delays between requests

### "Bad credentials"
**Cause**: Authentication token expired or invalid
**Fix**:
1. Go to Connections
2. Find GitHub connection
3. Click "Reconnect"
4. Re-authorize with GitHub

## Test Checklist

- [ ] Connection successful
- [ ] Correct repository selected
- [ ] Action completes without errors
- [ ] Data appears correctly in GitHub
- [ ] Permissions are sufficient
- [ ] Trigger detects events (if using trigger)
- [ ] Error handling works
- [ ] Rate limits not exceeded

## Tips & Best Practices

### Repository Management
- **Use full names**: Always use "owner/repo" format
- **Check permissions**: Verify access before automation
- **Test on test repos**: Don't test on production repositories
- **Document automation**: Add comments explaining automated actions

### Issue Management
- **Use templates**: Create consistent issues
- **Auto-label**: Categorize issues automatically
- **Link related items**: Reference PRs, commits
- **Close stale issues**: Automate cleanup

### Pull Request Automation
- **Auto-assign reviewers**: Based on file changes
- **Status checks**: Integrate with CI/CD
- **Auto-merge**: Only for trusted automated PRs
- **Require approvals**: Don't bypass review process

### Security
- **Limit permissions**: Request only needed scopes
- **Protect branches**: Don't automate pushes to main/production
- **Review automation**: Audit automated actions regularly
- **Use secrets safely**: Never expose tokens in issues/PRs

### Performance
- **Batch operations**: Group related actions
- **Cache data**: Store frequently accessed data
- **Use webhooks**: More efficient than polling
- **Monitor rate limits**: Track API usage

## Advanced Patterns

### Auto-Label Issues
```
Trigger: New Issue
Action: Update Issue
  - Add label based on title keywords
  - Assign to team based on label
```

### Release Notification
```
Trigger: New Release
Actions:
  1. Format release notes
  2. Send to Slack
  3. Update documentation
  4. Notify stakeholders
```

### PR Review Reminder
```
Trigger: New Pull Request
Actions:
  1. Wait 24 hours
  2. Check if reviewed
  3. If not, send reminder
```

### Issue to Task
```
Trigger: New Issue with label "task"
Actions:
  1. Create task in project management tool
  2. Link back to GitHub issue
  3. Notify assignee
```

### Automated Changelog
```
Trigger: Push to main branch
Actions:
  1. Get commit messages
  2. Format as changelog
  3. Update CHANGELOG.md
  4. Commit changes
```

## GitHub API Limits

### Rate Limits
- **Authenticated**: 5,000 requests/hour
- **Unauthenticated**: 60 requests/hour
- **Search API**: 30 requests/minute

### Best Practices
- Always use authenticated requests
- Implement exponential backoff
- Cache responses when possible
- Use conditional requests (ETags)

## Webhook vs Polling

### Webhooks (Recommended)
- **Pros**: Real-time, efficient, no rate limits
- **Cons**: Requires public endpoint
- **Setup**: Configure in repository settings

### Polling (Default)
- **Pros**: Easy setup, works everywhere
- **Cons**: Delayed, uses API quota
- **Interval**: Minimum 5 minutes

## Related Documentation

- [Core Concepts: Triggers](04-core-concepts.md#triggers-vs-actions)
- [Troubleshooting: Connection Problems](07-troubleshooting-hub.md#connectionauth-problems)
- [Rate Limits](07-troubleshooting-hub.md#rate-limits--timeouts)
- [Error Reference](08-error-reference.md)

## Example Use Cases

### Bug Report to Issue
Webhook (bug report) → Create GitHub Issue → Notify team

### Deploy on Release
New Release → Trigger deployment → Update status

### PR Review Automation
New PR → Assign reviewers → Send notifications → Track status

### Issue Triage
New Issue → Analyze content → Auto-label → Assign to team

### Documentation Updates
Push to docs/ → Update external docs → Notify writers

## GitHub Actions vs Defense Catalyst

### Use GitHub Actions for:
- CI/CD pipelines
- Code testing
- Build processes
- GitHub-native workflows

### Use Defense Catalyst for:
- Cross-platform automation
- External integrations
- Business process automation
- Non-code workflows

### Use Both:
- GitHub Actions for code
- Defense Catalyst for notifications and external integrations

## Need Help?

- Check [GitHub API Documentation](https://docs.github.com/en/rest)
- Review [Troubleshooting Hub](07-troubleshooting-hub.md)
- Contact [Support](13-contact-support.md)
- Join community discussions

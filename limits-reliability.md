# Limits & Reliability

## Overview

This document sets expectations for Defense Catalyst's operational limits, performance characteristics, and reliability guarantees. Understanding these limits helps you design efficient, reliable workflows.

---


### Flow Limits

**Steps per Flow**:
- Maximum: 50 steps
- Recommended: 20 steps or fewer
- Complex flows may hit execution limits

**Flow Size**:
- Maximum configuration size: 5 MB
- Includes all step configurations
- Large flows may be slower to load

**Branches per Flow**:
- Maximum: 10 parallel branches
- Affects execution time
- Consider splitting complex logic

### Execution Limits

**Run Duration**:
- Maximum: 5 minutes per run
- Timeout after 5 minutes
- Use async processing for longer tasks

**Concurrent Executions**:
- Free tier: 1 concurrent run
- Professional: 5 concurrent runs
- Enterprise: 20 concurrent runs

**Data Size per Step**:
- Maximum input: 10 MB
- Maximum output: 10 MB
- Large data may cause timeouts

**Total Run Data**:
- Maximum: 50 MB per run
- Includes all step inputs/outputs
- Exceeding causes run failure

---

## Rate Limits

### Defense Catalyst Platform

**API Requests**:
- 100 requests per minute per user
- 10,000 requests per hour per workspace
- Applies to API calls to Defense Catalyst

**Flow Executions**:
- Free tier: 1,000 runs/month
- Professional: 10,000 runs/month
- Enterprise: Unlimited

**Webhook Triggers**:
- 1,000 requests per minute per webhook
- DDoS protection enabled
- Excessive requests may be throttled

### Per-Integration Rate Limits

These are limits imposed by external services:

| Service | Rate Limit | Period | Notes |
|---------|------------|--------|-------|
| Google Sheets | 100 requests | 100 seconds | Per user |
| Slack | 1 request | 1 second | Per app |
| GitHub | 5,000 requests | 1 hour | Authenticated |
| OpenAI | Varies | 1 minute | By plan |
| Gmail | 500 emails | 1 day | Free account |
| SendGrid | 100 emails | 1 day | Free tier |
| Webhook (outbound) | 100 requests | 1 minute | Per flow |

**Important**: These limits are set by external providers and may change. Always check provider documentation for current limits.

### What Happens When You Hit Limits

**Platform Limits**:
- Request rejected with error
- Error code: `RATE_LIMIT_EXCEEDED`
- Retry after cooldown period
- Automatic retry with backoff

**External Service Limits**:
- Service returns rate limit error
- Flow run fails
- Manual retry required
- Or wait for limit reset

### Avoiding Rate Limits

**Best Practices**:
- Batch operations when possible
- Add delays between requests
- Use caching for repeated data
- Schedule flows during off-peak hours
- Monitor usage regularly
- Implement exponential backoff

**Example: Adding Delays**:
```
Step 1: Get data
Step 2: Wait 1 second
Step 3: Process data
Step 4: Wait 1 second
Step 5: Send result
```

---

## Polling Intervals

### Trigger Polling

**Minimum Interval**: 5 minutes

**Available Intervals**:
- Every 5 minutes
- Every 15 minutes
- Every 30 minutes
- Every hour
- Every 6 hours
- Every 12 hours
- Every 24 hours

**How Polling Works**:
1. Trigger checks for new data
2. If found, flow executes
3. If not, waits until next interval
4. Repeats continuously

**Polling vs Webhooks**:
- **Polling**: Checks periodically, delayed
- **Webhooks**: Real-time, instant
- Use webhooks when available

### Schedule Resolution

**Cron Precision**:
- Minimum: 5 minutes
- Resolution: 1 minute
- Best-effort timing (not guaranteed to the second)

**Example**:
```
Scheduled for: 14:00:00
Actual execution: 14:00:03 - 14:00:15
Variation: ±15 seconds typical
```

**Why Variation Occurs**:
- System load
- Queue processing
- Resource availability
- Network latency

---

## Timeouts

### Default Timeouts

**Per Step**:
- Default: 30 seconds
- Maximum: 120 seconds (2 minutes)
- Configurable in step settings

**Total Run**:
- Maximum: 5 minutes
- Includes all steps
- Cannot be extended

**Connection Test**:
- Timeout: 10 seconds
- Tests must complete quickly

### Timeout Behavior

**What Happens**:
1. Step exceeds timeout
2. Step marked as failed
3. Error: `ACTION_TIMEOUT`
4. Subsequent steps don't run
5. Run marked as failed

**Handling Timeouts**:
- Increase timeout setting (if available)
- Optimize request (reduce data size)
- Use async processing
- Split into multiple steps
- Contact external service provider

### Services with Known Slow Response

- Large file processing
- Complex AI operations
- Batch data operations
- Report generation
- Video processing

**Recommendation**: Use async patterns or external processing for these operations.

---

## Data Retention

### Run History

**Retention Period**:
- Free tier: 7 days
- Professional: 30 days
- Enterprise: 90 days

**What's Retained**:
- Run status
- Execution timeline
- Input/output data
- Error messages
- Metadata

**After Retention Period**:
- Run data deleted
- Cannot be recovered
- Export important data before expiration

### Logs

**Retention Period**:
- System logs: 30 days
- Error logs: 90 days
- Audit logs: 1 year (Enterprise)

**What's Logged**:
- Flow executions
- API calls
- Authentication events
- Configuration changes
- Errors and warnings

### Connection Data

**Retention**:
- Stored until deleted
- Encrypted at rest
- Automatically removed when connection deleted

**Credentials**:
- OAuth tokens refreshed automatically
- API keys stored securely
- Passwords encrypted

### Archived Flows

**Retention**:
- Indefinite (until deleted)
- Configuration preserved
- Run history follows retention policy
- Can be restored anytime

---

## Retry Behavior

### Automatic Retries

**When Retries Occur**:
- Network errors
- Temporary service unavailability
- Rate limit errors (with backoff)
- Timeout errors (sometimes)

**Retry Schedule**:
```
Attempt 1: Immediate
Attempt 2: 1 minute later
Attempt 3: 5 minutes later
Attempt 4: 15 minutes later
Attempt 5: 1 hour later
Maximum: 5 attempts
```

**Exponential Backoff**:
- Wait time increases with each retry
- Prevents overwhelming services
- Gives time for issues to resolve

### No Automatic Retry

**These errors don't retry**:
- Configuration errors
- Invalid data
- Authentication failures
- Permission denied
- Validation errors

**Why**: These require manual intervention to fix.

### Manual Retry

**How to Retry**:
1. Open failed run
2. Click "Retry" button
3. Run executes with same data
4. Check results

**When to Retry**:
- After fixing configuration
- After updating credentials
- After external service recovers
- After temporary issue resolves

---

## Reliability Guarantees

### Uptime SLA

**Target Uptime**: 99.9%
- Approximately 43 minutes downtime per month
- Excludes scheduled maintenance
- Enterprise: 99.95% SLA available

**Monitoring**:
- Real-time status monitoring
- Automated alerts
- Status page: [status.defensecatalyst.com]

### Data Durability

**Guarantees**:
- 99.999999999% (11 nines) durability
- Multiple redundant backups
- Geographic replication
- Point-in-time recovery

**What's Protected**:
- Flow configurations
- Connection data
- Run history (within retention)
- User data

### Disaster Recovery

**Recovery Time Objective (RTO)**: 4 hours
- Maximum time to restore service

**Recovery Point Objective (RPO)**: 1 hour
- Maximum data loss in disaster

**Backup Schedule**:
- Continuous replication
- Hourly snapshots
- Daily backups
- Weekly archives

### Maintenance Windows

**Scheduled Maintenance**:
- Announced 7 days in advance
- Typically during low-traffic hours
- Duration: 1-2 hours
- Monthly or as needed

**Emergency Maintenance**:
- Announced as soon as possible
- For critical security or stability issues
- Minimized duration

**During Maintenance**:
- Some features may be unavailable
- Flows may not execute
- API may be limited
- Status page updated

---

## Performance Expectations

### Execution Speed

**Typical Run Duration**:
- Simple flow (3 steps): 1-3 seconds
- Medium flow (10 steps): 5-15 seconds
- Complex flow (20+ steps): 30-60 seconds

**Factors Affecting Speed**:
- Number of steps
- External API response times
- Data size
- Network latency
- System load

### Trigger Latency

**Webhook Triggers**:
- Near real-time
- Typically < 1 second
- Depends on network

**Polling Triggers**:
- Minimum 5 minutes
- Depends on polling interval
- Not real-time

**Schedule Triggers**:
- ±15 seconds of scheduled time
- Best-effort timing
- System load affects precision

### API Response Times

**Defense Catalyst API**:
- Average: < 200ms
- 95th percentile: < 500ms
- 99th percentile: < 1s

**Flow Execution API**:
- Trigger flow: < 100ms (async)
- Get run status: < 200ms
- List runs: < 500ms

---

## Scaling Considerations

### Horizontal Scaling

**What Scales**:
- Number of flows
- Number of users
- Concurrent executions
- API throughput

**What Doesn't Scale**:
- Individual flow complexity
- Single run duration
- Step timeout limits

### Vertical Scaling

**Enterprise Features**:
- Higher concurrency limits
- Longer retention periods
- Dedicated resources
- Priority support

### Best Practices for Scale

**Design for Scale**:
- Keep flows simple
- Batch operations
- Use caching
- Implement error handling
- Monitor performance

**Avoid**:
- Very frequent schedules (< 5 min)
- Extremely large data payloads
- Deeply nested flows
- Synchronous long-running operations

---

## Monitoring & Alerts

### Built-in Monitoring

**What's Monitored**:
- Flow execution success rate
- Run duration
- Error rates
- Connection health
- API usage

**Dashboards**:
- Workspace overview
- Flow performance
- Error trends
- Usage metrics

### Setting Up Alerts

**Alert Types**:
- Flow failure
- High error rate
- Connection expired
- Quota approaching
- Performance degradation

**Notification Channels**:
- Email
- Slack
- Webhook
- SMS (Enterprise)

### Metrics to Track

**Key Metrics**:
- Success rate (target: > 99%)
- Average duration (track trends)
- Error rate (target: < 1%)
- API usage (vs limits)
- Connection health

---

## Quotas & Billing

### Usage Quotas

**What Counts**:
- Flow executions
- API calls
- Data transfer
- Storage

**Quota Resets**:
- Monthly on billing date
- Automatic reset
- No rollover

### Overage Handling

**When Quota Exceeded**:
- Flows stop executing
- API returns quota error
- Email notification sent
- Upgrade prompt shown

**Options**:
- Upgrade plan
- Purchase additional quota
- Wait for reset
- Optimize usage

---

## Related Documentation

- [Troubleshooting: Rate Limits](troubleshooting-hub.md#rate-limits--timeouts)
- [Error Reference](error-reference.md)
- [Runs & Debugging](runs-logs-debugging.md)
- [Security & Privacy](security-privacy.md)

---

## Quick Reference

### Key Limits

| Limit | Value |
|-------|-------|
| Max steps per flow | 50 |
| Max run duration | 5 minutes |
| Max data per step | 10 MB |
| Min polling interval | 5 minutes |
| Default step timeout | 30 seconds |
| Run history retention | 7-90 days |

### Rate Limits

| Resource | Limit |
|----------|-------|
| API requests | 100/min per user |
| Flow executions | 1,000-10,000/month |
| Webhook requests | 1,000/min |

### Contact

For limit increases or custom requirements:
- Enterprise sales: [Contact Support](contact-support.md)
- Technical questions: [Support](contact-support.md)


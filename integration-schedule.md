# Schedule (Cron) Integration

## Overview

The Schedule trigger allows you to run workflows automatically at specific times or intervals using cron expressions. Perfect for recurring tasks, periodic data syncs, and time-based automation.

---

## What It Enables

### Common Use Cases

1. **Daily Reports**: Generate and send reports every morning at 9 AM
2. **Data Synchronization**: Sync data between systems every hour
3. **Cleanup Tasks**: Delete old records every night at midnight
4. **Monitoring**: Check system health every 5 minutes
5. **Batch Processing**: Process queued items every 15 minutes
6. **Reminders**: Send weekly reminders every Monday morning

---

## Prerequisites

- Access to Defense Catalyst workspace
- Understanding of cron expressions (we'll help with this!)
- No external accounts needed - this is built-in

---

## How to Use Schedule Trigger

### Step 1: Add Schedule Trigger

1. Create a new flow or edit existing flow
2. Click "Select Trigger"
3. Search for "Schedule"
4. Select "Schedule" trigger

### Step 2: Configure Schedule

Choose your scheduling method:

#### **Option A: Simple Intervals**

For basic recurring tasks:
- **Every Hour**: Runs at the top of every hour
- **Every Day**: Runs once per day at midnight UTC
- **Every Week**: Runs once per week on Sunday at midnight UTC
- **Every Month**: Runs on the 1st of each month at midnight UTC

#### **Option B: Cron Expression**

For precise control, use cron expressions:

**Format**: `minute hour day month day-of-week`

**Examples**:
```
0 9 * * *        # Every day at 9:00 AM UTC
0 */2 * * *      # Every 2 hours
*/15 * * * *     # Every 15 minutes
0 0 * * 1        # Every Monday at midnight
0 9 1 * *        # First day of every month at 9 AM
0 18 * * 1-5     # Weekdays at 6 PM
```

### Step 3: Set Timezone (Important!)

1. Select your timezone from dropdown
2. Default is UTC
3. Schedule will run according to selected timezone

**Example**: If you select "America/New_York" and set "0 9 * * *", the flow runs at 9 AM Eastern Time.

### Step 4: Test Your Schedule

1. Click "Test Trigger"
2. Schedule will fire immediately for testing
3. Verify your flow runs correctly
4. Check output data

### Step 5: Enable Flow

1. Click "Publish" to enable
2. Flow will now run on schedule
3. View upcoming runs in flow details

---

## Cron Expression Guide

### Basic Syntax

```
┌───────────── minute (0 - 59)
│ ┌───────────── hour (0 - 23)
│ │ ┌───────────── day of month (1 - 31)
│ │ │ ┌───────────── month (1 - 12)
│ │ │ │ ┌───────────── day of week (0 - 6) (Sunday = 0)
│ │ │ │ │
* * * * *
```

### Special Characters

- `*` = Any value (every)
- `,` = List of values (1,3,5)
- `-` = Range of values (1-5)
- `/` = Step values (*/15 = every 15)

### Common Patterns

| Pattern | Description | Cron Expression |
|---------|-------------|-----------------|
| Every minute | Runs every minute | `* * * * *` |
| Every 5 minutes | Runs every 5 minutes | `*/5 * * * *` |
| Every 15 minutes | Runs every 15 minutes | `*/15 * * * *` |
| Every 30 minutes | Runs every 30 minutes | `*/30 * * * *` |
| Every hour | Top of every hour | `0 * * * *` |
| Every 2 hours | Every 2 hours | `0 */2 * * *` |
| Every day at 9 AM | Daily at 9:00 AM | `0 9 * * *` |
| Every day at midnight | Daily at 12:00 AM | `0 0 * * *` |
| Every Monday at 9 AM | Weekly on Monday | `0 9 * * 1` |
| Every weekday at 6 PM | Mon-Fri at 6 PM | `0 18 * * 1-5` |
| First of month at 9 AM | Monthly on 1st | `0 9 1 * *` |
| Every 1st and 15th | Twice monthly | `0 9 1,15 * *` |

### Business Hours Examples

```
0 9-17 * * 1-5    # Every hour from 9 AM to 5 PM, weekdays only
*/30 9-17 * * 1-5 # Every 30 min during business hours, weekdays
0 9,12,15,17 * * 1-5  # 9 AM, noon, 3 PM, 5 PM on weekdays
```

---

## Available Triggers

### Schedule Trigger

**Description**: Runs flow on a recurring schedule

**Configuration**:
- **Cron Expression**: When to run (required)
- **Timezone**: Which timezone to use (required)

**Output Data**:
```json
{
  "scheduledTime": "2025-01-18T09:00:00Z",
  "actualTime": "2025-01-18T09:00:01.234Z",
  "timezone": "America/New_York"
}
```

---

## Common Errors & Fixes

### ❌ "Invalid cron expression"

**Cause**: Cron syntax is incorrect

**Fix**:
1. Check cron expression format
2. Use cron validator tool online
3. Try a simple interval first
4. Verify all 5 fields are present

**Example Fix**:
- ❌ Wrong: `0 9 * *` (missing day-of-week)
- ✅ Right: `0 9 * * *`

---

### ❌ "Schedule not firing at expected time"

**Cause**: Timezone mismatch

**Fix**:
1. Check selected timezone in trigger settings
2. Remember: Default is UTC
3. Convert your local time to selected timezone
4. Test with immediate run first

**Example**:
- You want 9 AM Eastern Time
- Select timezone: "America/New_York"
- Use cron: `0 9 * * *`
- Don't use UTC time in cron when timezone is set

---

### ❌ "Flow runs too frequently"

**Cause**: Cron expression runs more often than intended

**Fix**:
1. Review cron expression carefully
2. Check for `*` in minute field (runs every minute!)
3. Use step values: `*/15` instead of `*`
4. Test schedule before enabling

**Example Fix**:
- ❌ Wrong: `* * * * *` (every minute!)
- ✅ Right: `0 * * * *` (every hour)

---

### ❌ "Missed scheduled runs"

**Cause**: Flow was disabled or system maintenance

**Fix**:
1. Check flow is enabled (published)
2. Check run history for errors
3. Verify no system maintenance during scheduled time
4. Consider adding retry logic in flow

**Note**: If a scheduled run is missed, it won't be retroactively executed. The next scheduled time will be used.

---

## Test Checklist

- [ ] Cron expression is valid
- [ ] Timezone is correctly set
- [ ] Test trigger fires successfully
- [ ] Flow completes without errors
- [ ] Schedule matches your intention
- [ ] Flow is published (enabled)
- [ ] First scheduled run verified in history

---

## Tips & Best Practices

### Performance Tips

1. **Avoid Very Frequent Schedules**: Running every minute can be expensive
2. **Batch Operations**: Process multiple items per run instead of running more frequently
3. **Off-Peak Hours**: Schedule heavy tasks during low-traffic times
4. **Stagger Schedules**: Don't schedule all flows at the same time

### Reliability Tips

1. **Add Error Handling**: Use try-catch patterns in your flow
2. **Idempotency**: Design flows to handle duplicate runs safely
3. **Monitoring**: Check run history regularly
4. **Alerting**: Set up notifications for failed runs

### Timezone Tips

1. **Be Explicit**: Always set timezone, don't rely on defaults
2. **Daylight Saving**: Be aware of DST changes in your timezone
3. **UTC for Global**: Use UTC for international teams
4. **Document**: Note timezone in flow description

### Cron Expression Tips

1. **Start Simple**: Use simple intervals first, then optimize
2. **Test First**: Always test before enabling
3. **Use Comments**: Add flow description explaining schedule
4. **Validate**: Use online cron validators to verify expressions

---

## Advanced Patterns

### Conditional Execution

Even though schedule runs on time, you can add conditions:

```
1. Schedule trigger (every hour)
2. Branch step: Check if it's business hours
3. If yes: Run main logic
4. If no: Exit flow
```

### Multiple Schedules

Create separate flows for different schedules:
- Flow A: Hourly sync (0 * * * *)
- Flow B: Daily report (0 9 * * *)
- Flow C: Weekly cleanup (0 0 * * 0)

### Dynamic Scheduling

For dynamic schedules, use external schedulers:
1. Use webhook trigger instead
2. External cron service calls webhook
3. More flexibility but more complexity

---

## Limitations

- **Minimum Interval**: 1 minute (cannot run more frequently)
- **Maximum Schedules**: No limit on number of scheduled flows
- **Execution Time**: Each run must complete within timeout limits
- **Missed Runs**: Not retroactively executed
- **Precision**: Runs within ~30 seconds of scheduled time

---

## Related Documentation

- [Core Concepts: Triggers](04-core-concepts.md#triggers-vs-actions)
- [Runs & Debugging](09-runs-logs-debugging.md)
- [Troubleshooting: Workflow Won't Trigger](07-troubleshooting-hub.md#my-workflow-wont-trigger)
- [Limits & Reliability](10-limits-reliability.md)

---

## Need Help?

- **Cron Validator**: Use [crontab.guru](https://crontab.guru) to validate expressions
- **Timezone List**: See [IANA timezone database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
- **Support**: [Contact Support](13-contact-support.md) with your cron expression and expected behavior

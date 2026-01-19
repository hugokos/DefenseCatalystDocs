# Runs, Logs & Debugging Guide

## Overview

This guide teaches you how to use Defense Catalyst's debugging tools to inspect workflow executions, diagnose issues, and understand what's happening in your flows.

**What you'll learn**:
- Finding and filtering run history
- Inspecting run details
- Understanding run statuses
- Debugging failed runs
- Common failure patterns
- What to include when contacting support

---

## Finding Run History

### Accessing Runs

**From Flow Builder**:
1. Open your flow
2. Click "Runs" tab or "View Runs" button
3. See all executions for this flow

**From Dashboard**:
1. Go to main dashboard
2. Click "Runs" in navigation
3. See all runs across all flows

**From Workspace**:
1. Navigate to workspace view
2. Select "All Runs"
3. Filter by flow, status, date

### Run List View

Each run shows:
- **Status**: Success, Failed, Running, Stopped
- **Flow Name**: Which flow executed
- **Trigger**: What started the run
- **Duration**: How long it took
- **Timestamp**: When it ran
- **Actions**: View details, retry, etc.

---

## Filtering Runs

### By Status

**Succeeded** ✅
- Completed without errors
- All steps executed successfully
- Green indicator

**Failed** ❌
- Encountered an error
- Stopped at failing step
- Red indicator

**Running** ⏳
- Currently executing
- In progress
- Blue indicator

**Stopped** ⏹️
- Manually stopped
- Cancelled by user
- Gray indicator

### By Date Range

- **Today**: Runs from last 24 hours
- **Last 7 Days**: Past week
- **Last 30 Days**: Past month
- **Custom Range**: Specify dates

### By Flow

- Filter to specific flow
- See only runs for selected workflow
- Compare performance across flows

### By Trigger Type

- Webhook runs
- Scheduled runs
- Manual test runs
- App event runs

---

## Inspecting a Run

### Run Overview

Click on any run to see details:

**Header Information**:
- Run ID (unique identifier)
- Status (success/failed/running)
- Start time
- End time
- Total duration
- Trigger type

**Quick Actions**:
- Retry run
- Copy run ID
- Share run link
- Export run data

### Step-by-Step Execution View

See each step in your flow:

```
1. ✅ Webhook Trigger
   Duration: 0.1s
   Status: Success

2. ✅ Get User Data
   Duration: 0.5s
   Status: Success

3. ❌ Send Email
   Duration: 2.0s
   Status: Failed
   Error: Authentication failed

4. ⏭️ Update Database
   Status: Skipped (previous step failed)
```

### Inspecting Step Details

Click on any step to see:

**Input Data**:
- What data was sent to this step
- Values from previous steps
- Mapped variables
- Configuration settings

**Output Data**:
- What data was returned
- Response from external service
- Transformed data
- Available for next steps

**Error Information** (if failed):
- Error message
- Error code
- Stack trace (if available)
- Suggested fixes

**Execution Metadata**:
- Step duration
- Retry attempts
- API calls made
- Resource usage

---

## Understanding Run Statuses

### Success ✅

**What it means**:
- All steps completed
- No errors encountered
- Expected outcome achieved

**What to check**:
- Verify output is correct
- Check external systems updated
- Confirm notifications sent

**Common issues**:
- Flow succeeded but result is wrong
- Data mapping incorrect
- Logic error in conditions

### Failed ❌

**What it means**:
- A step encountered an error
- Execution stopped
- Subsequent steps didn't run

**What to check**:
- Which step failed
- Error message
- Input data to failed step
- Connection status

**Common causes**:
- Authentication expired
- Invalid data format
- External service error
- Rate limit exceeded
- Timeout

### Running ⏳

**What it means**:
- Flow is currently executing
- Steps are being processed
- Not yet complete

**What to check**:
- Current step
- Duration so far
- Expected completion time

**If stuck**:
- Check for timeout
- Verify external service responding
- Consider stopping and retrying

### Stopped ⏹️

**What it means**:
- Manually cancelled
- User intervention
- Didn't complete naturally

**What to check**:
- Why it was stopped
- Which step was running
- Any partial changes made

---

## Debugging Failed Runs

### Step 1: Identify the Failing Step

1. Open failed run
2. Find step with ❌ error icon
3. Note step name and type
4. Check if it's trigger or action

### Step 2: Read the Error Message

1. Click on failed step
2. Expand error details
3. Read full error message
4. Note error code (if present)
5. Look for specific details

**Example Error Messages**:
```
❌ Authentication failed
Connection credentials are invalid or expired.
Error Code: CONNECTION_INVALID

❌ Rate limit exceeded
Too many requests. Try again in 60 seconds.
Error Code: RATE_LIMIT_EXCEEDED

❌ Invalid input
Required field 'email' is missing.
Error Code: REQUIRED_FIELD_MISSING
```

### Step 3: Inspect Input Data

1. Expand "Input" section of failed step
2. Check all input fields
3. Verify required fields have values
4. Check data format is correct
5. Look for null/undefined values

**What to look for**:
- Missing required fields
- Wrong data types
- Malformed JSON
- Empty strings
- Null values

### Step 4: Check Previous Steps

1. Review steps before the failure
2. Verify they completed successfully
3. Check their output data
4. Ensure data is available for mapping

**Common issues**:
- Previous step returned null
- Data structure changed
- API response different than expected

### Step 5: Verify Configuration

1. Open flow editor
2. Check failed step configuration
3. Verify all settings correct
4. Check connection is active
5. Test connection if needed

### Step 6: Test in Isolation

1. Create test flow with just failing step
2. Use known good data
3. Test step independently
4. Identify if issue is step-specific or data-specific

---

## Common Failure Patterns

### Intermittent Failures

**Symptoms**:
- Sometimes succeeds, sometimes fails
- No pattern to failures
- Same configuration

**Common causes**:
- Network issues
- External service instability
- Rate limiting
- Timeout variations

**Solutions**:
- Implement retry logic
- Add error handling
- Increase timeout
- Monitor external service status

### Consistent Failures

**Symptoms**:
- Always fails at same step
- Same error message
- Predictable

**Common causes**:
- Configuration error
- Invalid credentials
- Missing permissions
- Wrong data format

**Solutions**:
- Fix configuration
- Update credentials
- Request permissions
- Correct data mapping

### Data-Dependent Failures

**Symptoms**:
- Fails with certain data
- Succeeds with other data
- Edge cases

**Common causes**:
- Special characters
- Null values
- Out of range values
- Unexpected data structure

**Solutions**:
- Add data validation
- Handle edge cases
- Use default values
- Transform data before use

### Timeout Failures

**Symptoms**:
- Fails after long duration
- "Timeout" error message
- Slow external service

**Common causes**:
- Slow API response
- Large data payload
- Network latency
- Service overload

**Solutions**:
- Increase timeout setting
- Reduce data size
- Optimize request
- Use async processing
- Try off-peak hours

---

## Debugging Strategies

### 1. Start from the Beginning

- Check trigger configuration
- Verify trigger fired correctly
- Inspect trigger output data
- Ensure flow is published and enabled

### 2. Follow the Data

- Trace data through each step
- Verify transformations are correct
- Check data types match expectations
- Look for where data becomes invalid

### 3. Isolate the Problem

- Test steps individually
- Use known good data
- Eliminate variables
- Narrow down root cause

### 4. Check External Dependencies

- Verify external services are up
- Check API status pages
- Test connections
- Review service logs

### 5. Compare Working vs Failing

- Find a successful run
- Compare to failed run
- Identify differences
- Focus on what changed

### 6. Use Test Mode

- Test flow with sample data
- Verify each step works
- Check output at each stage
- Fix issues before publishing

---

## Debugging Tools

### Run Details View

**What it shows**:
- Complete execution timeline
- Input/output for each step
- Error messages and codes
- Execution metadata

**How to use**:
- Click on any run
- Expand steps to see details
- Copy data for testing
- Export for analysis

### Test Mode

**What it does**:
- Runs flow with sample data
- Doesn't affect production
- Shows real-time execution
- Allows step-by-step testing

**How to use**:
- Click "Test" in flow builder
- Provide sample data
- Watch execution in real-time
- Fix issues before publishing

### Connection Tester

**What it does**:
- Tests connection credentials
- Verifies permissions
- Checks connectivity
- Validates configuration

**How to use**:
- Go to Connections page
- Find connection
- Click "Test Connection"
- Review results

### Data Inspector

**What it shows**:
- Raw data at each step
- JSON structure
- Data types
- Available fields

**How to use**:
- Click on step in run details
- Expand "Output" section
- Inspect data structure
- Copy for testing

---

## Retry Logic

### Manual Retry

**When to use**:
- Temporary error occurred
- External service was down
- Network issue resolved
- Credentials updated

**How to retry**:
1. Open failed run
2. Click "Retry" button
3. Run executes again with same data
4. Check if successful

### Automatic Retry

**How it works**:
- System automatically retries failed runs
- Uses exponential backoff
- Limited number of attempts
- Only for certain error types

**Retry schedule**:
```
Attempt 1: Immediate
Attempt 2: After 1 minute
Attempt 3: After 5 minutes
Attempt 4: After 15 minutes
Attempt 5: After 1 hour
```

**Not retried automatically**:
- Configuration errors
- Invalid data
- Permission denied
- Validation failures

---

## What to Include When Contacting Support

When you need help debugging, provide:

### Required Information

**Workspace ID**:
- Where to find: Settings → Workspace → ID
- Format: `ws_xxxxxxxxxxxxx`

**Flow ID**:
- Where to find: Flow settings → Flow ID
- Format: `flow_xxxxxxxxxxxxx`

**Run ID**:
- Where to find: Run details → Run ID
- Format: `run_xxxxxxxxxxxxx`

**Timestamp**:
- When the issue occurred
- Include timezone
- Format: `2025-01-18 14:30:00 UTC`

**Error Message**:
- Exact error text
- Error code (if present)
- Full error details

### Helpful Information

**Screenshots**:
- Run details view
- Failed step details
- Error message
- Configuration settings

**Steps to Reproduce**:
1. What you did
2. What you expected
3. What actually happened

**Recent Changes**:
- Did you modify the flow?
- Did you update connections?
- Did external service change?

**Environment**:
- Browser and version (for UI issues)
- Operating system
- Network environment

### Support Request Template

```
Subject: Flow Execution Failed - [Brief Description]

Workspace ID: ws_xxxxxxxxxxxxx
Flow ID: flow_xxxxxxxxxxxxx
Run ID: run_xxxxxxxxxxxxx
Timestamp: 2025-01-18 14:30:00 UTC

Error Message:
[Exact error text]

Description:
[What you were trying to accomplish]

Steps to Reproduce:
1. [Step 1]
2. [Step 2]
3. [Error occurs]

Expected Behavior:
[What should happen]

Actual Behavior:
[What actually happened]

Recent Changes:
[Any recent modifications]

Troubleshooting Attempted:
- [What you've tried]
- [Results of attempts]

Screenshots:
[Attach screenshots]
```

---

## Best Practices

### During Development

- ✅ Test flows thoroughly before publishing
- ✅ Use test mode with sample data
- ✅ Verify each step independently
- ✅ Add error handling
- ✅ Use descriptive step names
- ✅ Document complex logic

### During Operation

- ✅ Monitor run history regularly
- ✅ Set up alerts for failures
- ✅ Review failed runs promptly
- ✅ Keep connections updated
- ✅ Track error patterns
- ✅ Document solutions

### For Debugging

- ✅ Start with error message
- ✅ Check input data first
- ✅ Verify configuration
- ✅ Test connections
- ✅ Isolate the problem
- ✅ Compare working vs failing runs

---

## Related Documentation

- [Troubleshooting Hub](07-troubleshooting-hub.md) - Symptom-based troubleshooting
- [Error Reference](08-error-reference.md) - Error codes and meanings
- [Core Concepts: Runs](04-core-concepts.md#runs--execution) - Understanding runs
- [Contact Support](13-contact-support.md) - Getting help

---

## Quick Reference

### Run Status Icons

- ✅ **Success**: All steps completed
- ❌ **Failed**: Error encountered
- ⏳ **Running**: Currently executing
- ⏹️ **Stopped**: Manually cancelled

### Common Debug Steps

1. Find failed step
2. Read error message
3. Check input data
4. Verify configuration
5. Test connection
6. Retry if temporary error

### When to Contact Support

- Error persists after troubleshooting
- Unclear error message
- System error (not configuration)
- Need help understanding logs
- Suspected platform issue

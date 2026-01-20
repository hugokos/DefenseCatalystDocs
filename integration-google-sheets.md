# Google Sheets Integration

## What It Enables

Connect Defense Catalyst to Google Sheets to automate spreadsheet operations:

- **Data Collection**: Add form responses, survey data, or logs to sheets
- **Reporting**: Generate reports from workflow data
- **Data Sync**: Keep sheets in sync with other systems
- **Notifications**: Trigger workflows when sheet data changes
- **Batch Updates**: Update multiple rows based on conditions

## Prerequisites

- Google account with access to Google Sheets
- Permission to create/edit sheets in your Google Drive
- Admin approval (if using Google Workspace with restrictions)

## How to Connect

### Step 1: Add Google Sheets Action

1. In your flow, click "+" to add a step
2. Search for "Google Sheets"
3. Select the action you want (e.g., "Add Row to Sheet")

### Step 2: Authenticate with Google

1. Click "Connect" or "+ New Connection"
2. Click "Sign in with Google"
3. Select your Google account
4. Review permissions requested:
   - View and manage your spreadsheets
   - See, edit, create, and delete files
5. Click "Allow"

### Step 3: Configure Action

1. Select your spreadsheet from dropdown
2. Select the worksheet (tab) within the spreadsheet
3. Configure action-specific settings
4. Map data from previous steps

### Step 4: Test Connection

1. Click "Test" to verify connection
2. Check your Google Sheet for results
3. Verify data appears correctly

## Available Triggers

### New Row
**When**: A new row is added to the sheet
**Use Cases**: 
- Process form submissions
- React to manual data entry
- Trigger workflows from sheet updates

**Configuration**:
- Select spreadsheet
- Select worksheet
- Choose polling interval (how often to check)

**Note**: Uses polling, not real-time. Minimum 5-minute interval.

## Available Actions

### Add Row to Sheet
**What**: Appends a new row to the bottom of the sheet
**Required Fields**:
- Spreadsheet
- Worksheet
- Values (one per column)

**Example**:
```
Column A: {{trigger.name}}
Column B: {{trigger.email}}
Column C: {{trigger.timestamp}}
```

### Update Row
**What**: Updates an existing row based on criteria
**Required Fields**:
- Spreadsheet
- Worksheet
- Search column
- Search value
- New values

**Example**: Update status column where email matches

### Find Row
**What**: Searches for a row matching criteria
**Required Fields**:
- Spreadsheet
- Worksheet
- Search column
- Search value

**Returns**: First matching row data

### Delete Row
**What**: Deletes a row matching criteria
**Required Fields**:
- Spreadsheet
- Worksheet
- Row number or search criteria

**Warning**: Cannot be undone!

### Clear Sheet
**What**: Removes all data from worksheet (keeps headers)
**Required Fields**:
- Spreadsheet
- Worksheet

**Use Case**: Reset sheet before bulk import

### Get All Rows
**What**: Retrieves all rows from worksheet
**Required Fields**:
- Spreadsheet
- Worksheet

**Returns**: Array of row objects

**Note**: Large sheets may hit size limits

## Common Errors & Fixes

### "Permission denied"
**Cause**: Insufficient Google account permissions
**Fix**:
1. Disconnect and reconnect Google Sheets
2. Ensure you're using correct Google account
3. Check Google Workspace admin hasn't blocked access
4. Verify spreadsheet sharing settings

### "Spreadsheet not found"
**Cause**: Spreadsheet deleted or access revoked
**Fix**:
1. Verify spreadsheet still exists
2. Check you have edit access
3. Reconnect Google Sheets integration
4. Update spreadsheet selection in flow

### "Invalid range"
**Cause**: Worksheet name changed or doesn't exist
**Fix**:
1. Check worksheet name matches exactly (case-sensitive)
2. Verify worksheet wasn't deleted
3. Update worksheet selection in flow

### "Rate limit exceeded"
**Cause**: Too many requests to Google Sheets API
**Fix**:
1. Reduce flow execution frequency
2. Batch operations when possible
3. Add delays between operations
4. Check Google Sheets API quotas

### "Values don't match columns"
**Cause**: Number of values doesn't match sheet columns
**Fix**:
1. Count columns in your sheet
2. Provide value for each column (use empty string for blanks)
3. Ensure data mapping is correct

### "Invalid grant" or "Token expired"
**Cause**: Google authentication expired
**Fix**:
1. Go to Connections
2. Find Google Sheets connection
3. Click "Reconnect"
4. Re-authorize with Google

## Test Checklist

- [ ] Connection successful
- [ ] Correct spreadsheet selected
- [ ] Correct worksheet selected
- [ ] Data appears in correct columns
- [ ] Formatting preserved (dates, numbers)
- [ ] No duplicate rows created
- [ ] Trigger detects new rows (if using trigger)
- [ ] Error handling works

## Tips & Best Practices

### Data Organization
- **Use header row**: First row should contain column names
- **Consistent formatting**: Keep data types consistent per column
- **Avoid merged cells**: Can cause issues with automation
- **Freeze header row**: Makes sheet easier to read

### Performance
- **Limit sheet size**: Large sheets (>10,000 rows) can be slow
- **Use specific ranges**: Don't fetch entire sheet if you need one row
- **Batch operations**: Update multiple rows in one action when possible
- **Archive old data**: Move historical data to separate sheets

### Reliability
- **Don't delete columns**: Can break existing flows
- **Rename carefully**: Worksheet renames require flow updates
- **Test with real data**: Sample data may not reveal issues
- **Monitor quotas**: Google has daily API limits

### Security
- **Limit sheet access**: Only share with necessary users
- **Use service accounts**: For production workflows (advanced)
- **Don't store secrets**: Avoid API keys or passwords in sheets
- **Audit access**: Regularly review who has access

### Data Mapping
- **Handle empty cells**: Use default values or conditions
- **Format dates**: Use consistent date format (ISO 8601 recommended)
- **Trim whitespace**: Clean data before adding to sheet
- **Validate data**: Check data types before insertion

## Advanced Patterns

### Append with Timestamp
Always include timestamp for audit trail:
```
Column A: {{trigger.data}}
Column B: {{$now}}
Column C: {{$user.email}}
```

### Conditional Updates
Use "Find Row" then "Update Row" pattern:
1. Find row matching criteria
2. Check if row exists (condition)
3. Update if exists, add new row if not

### Batch Processing
Process multiple rows efficiently:
1. Use "Get All Rows" action
2. Filter rows in subsequent steps
3. Loop through results (if supported)
4. Update in batches

### Data Validation
Validate before inserting:
1. Check required fields are present
2. Verify data types (email, phone, etc.)
3. Ensure no duplicates
4. Add row only if validation passes

## Google Sheets Formulas

You can use formulas in your sheets that work with automated data:

### Auto-calculate totals
```
=SUM(B2:B100)
```

### Timestamp last update
```
=NOW()
```

### Conditional formatting
Apply colors based on values automatically

### Data validation
Restrict values in columns (dropdowns, ranges)

## Limitations

### Google API Quotas
- **Read requests**: 100 per 100 seconds per user
- **Write requests**: 100 per 100 seconds per user
- **Daily limit**: Varies by account type

### Sheet Size Limits
- **Maximum cells**: 10 million cells per spreadsheet
- **Maximum columns**: 18,278 columns per sheet
- **Maximum rows**: Limited by cell count

### Performance
- **Large sheets**: Operations slow down with >10,000 rows
- **Complex formulas**: Can delay automation
- **Polling delay**: Trigger checks every 5+ minutes

## Alternatives for Large Data

If you're hitting Google Sheets limits:
- **Google BigQuery**: For large datasets
- **PostgreSQL**: For relational data
- **Airtable**: For structured databases
- **CSV files**: For simple data storage

## Related Documentation

- [Core Concepts: Data Mapping](core-concepts.md#data-mapping)
- [Troubleshooting: Connection Problems](troubleshooting-hub.md#connectionauth-problems)
- [Limits & Reliability](limits-reliability.md)
- [First Workflow Tutorial](first-workflow-tutorial.md)

## Example Use Cases

### Form to Sheet
Webhook receives form data → Add row to Google Sheets

### Daily Report
Schedule trigger → Get data from API → Add rows to sheet

### Sheet to Slack
New row in sheet → Format message → Send to Slack

### Data Sync
Schedule trigger → Get all rows → Update external database

### Approval Workflow
New row → Send approval request → Update status column

## Need Help?

- Check [Troubleshooting Hub](troubleshooting-hub.md)
- Review [Error Reference](error-reference.md)
- Contact [Support](contact-support.md)


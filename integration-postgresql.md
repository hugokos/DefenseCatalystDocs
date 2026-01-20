# PostgreSQL Integration

## Overview

The PostgreSQL integration allows you to connect to PostgreSQL databases to read, write, update, and delete data. Perfect for database automation, data synchronization, and custom application workflows.

---

## What It Enables

### Common Use Cases

1. **Data Synchronization**: Sync data between PostgreSQL and other systems
2. **Automated Reports**: Query database and send reports
3. **Data Validation**: Check data integrity and send alerts
4. **Batch Updates**: Update multiple records based on conditions
5. **Audit Logging**: Log events to database
6. **Data Migration**: Move data between databases

---

## Prerequisites

- PostgreSQL database (version 9.6 or higher)
- Database connection details:
  - Host/IP address
  - Port (default: 5432)
  - Database name
  - Username
  - Password
- Network access to database
- Appropriate database permissions

---

## How to Connect

### Step 1: Gather Connection Information

You'll need:
```
Host: db.example.com
Port: 5432
Database: myapp_production
Username: app_user
Password: ••••••••
SSL Mode: require (recommended)
```

### Step 2: Add PostgreSQL Action

1. In your flow, click "Add Step"
2. Search for "PostgreSQL"
3. Select desired action
4. Click "New Connection"

### Step 3: Configure Connection

**Connection Name**: Give it a descriptive name
```
Production Database
```

**Host**: Database server address
```
db.example.com
```

**Port**: Database port (default 5432)
```
5432
```

**Database**: Database name
```
myapp_production
```

**Username**: Database user
```
app_user
```

**Password**: User password
```
your-secure-password
```

**SSL Mode**: Choose security level
- **disable**: No SSL (not recommended)
- **require**: Require SSL (recommended)
- **verify-ca**: Verify certificate authority
- **verify-full**: Full certificate verification

### Step 4: Test Connection

1. Click "Test Connection"
2. Verify connection succeeds
3. Save connection

### Step 5: Configure Action

Choose and configure your action (see Available Actions below)

---

## Available Actions

### Query Rows

**Description**: Execute SELECT query to retrieve data

**Configuration**:
- **Query**: SQL SELECT statement
- **Parameters**: Optional query parameters (for safety)

**Example**:
```sql
SELECT id, name, email, created_at
FROM users
WHERE status = $1
ORDER BY created_at DESC
LIMIT 10
```

**Parameters**:
```
$1: active
```

**Output**:
```json
{
  "rows": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "created_at": "2026-01-15T10:30:00Z"
    }
  ],
  "rowCount": 1
}
```

---

### Insert Row

**Description**: Insert a new row into a table

**Configuration**:
- **Table**: Table name
- **Columns**: Column values to insert

**Example**:
```
Table: users
Columns:
  name: {{trigger.name}}
  email: {{trigger.email}}
  status: active
  created_at: {{now}}
```

**Output**:
```json
{
  "insertedId": 123,
  "rowCount": 1
}
```

---

### Update Rows

**Description**: Update existing rows

**Configuration**:
- **Query**: SQL UPDATE statement
- **Parameters**: Query parameters

**Example**:
```sql
UPDATE users
SET status = $1, updated_at = $2
WHERE email = $3
```

**Parameters**:
```
$1: inactive
$2: {{now}}
$3: {{trigger.email}}
```

**Output**:
```json
{
  "rowCount": 1
}
```

---

### Delete Rows

**Description**: Delete rows from table

**Configuration**:
- **Query**: SQL DELETE statement
- **Parameters**: Query parameters

**Example**:
```sql
DELETE FROM sessions
WHERE expires_at < $1
```

**Parameters**:
```
$1: {{now}}
```

**Output**:
```json
{
  "rowCount": 15
}
```

---

### Execute Query

**Description**: Execute any SQL statement (DDL, DML, etc.)

**Configuration**:
- **Query**: Any SQL statement
- **Parameters**: Query parameters

**Example**:
```sql
CREATE INDEX IF NOT EXISTS idx_users_email
ON users(email)
```

**Output**:
```json
{
  "success": true,
  "rowCount": 0
}
```

---

## Common Errors & Fixes

### ❌ "Connection refused"

**Cause**: Cannot reach database server

**Fix**:
1. Verify host and port are correct
2. Check database server is running
3. Verify network connectivity
4. Check firewall rules allow connection
5. Verify IP whitelist includes Defense Catalyst

---

### ❌ "Authentication failed"

**Cause**: Invalid credentials

**Fix**:
1. Verify username is correct
2. Verify password is correct
3. Check user has login permission
4. Verify database name is correct
5. Check user is not locked

---

### ❌ "SSL connection required"

**Cause**: Database requires SSL but connection doesn't use it

**Fix**:
1. Change SSL Mode to "require"
2. Update connection settings
3. Test connection again

---

### ❌ "Permission denied for table"

**Cause**: User lacks table permissions

**Fix**:
1. Grant appropriate permissions:
```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON table_name TO app_user;
```
2. Verify permissions:
```sql
SELECT * FROM information_schema.table_privileges
WHERE grantee = 'app_user';
```

---

### ❌ "Syntax error in SQL query"

**Cause**: Invalid SQL syntax

**Fix**:
1. Test query in database client first
2. Check for typos
3. Verify table and column names
4. Use parameterized queries
5. Check PostgreSQL version compatibility

---

### ❌ "Too many connections"

**Cause**: Database connection limit reached

**Fix**:
1. Check current connections:
```sql
SELECT count(*) FROM pg_stat_activity;
```
2. Close unused connections
3. Increase max_connections (database admin)
4. Optimize flow to reuse connections

---

### ❌ "Query timeout"

**Cause**: Query takes too long to execute

**Fix**:
1. Optimize query (add indexes)
2. Reduce result set size (add LIMIT)
3. Check for table locks
4. Increase timeout setting
5. Run during off-peak hours

---

## Test Checklist

- [ ] Connection succeeds
- [ ] SSL is enabled (if required)
- [ ] User has appropriate permissions
- [ ] Query syntax is valid
- [ ] Query returns expected results
- [ ] Parameters are properly escaped
- [ ] Error handling is configured
- [ ] Connection is saved and reusable

---

## Tips & Best Practices

### Security Best Practices

1. **Use Parameterized Queries**: Prevent SQL injection
```sql
-- ❌ Dangerous
SELECT * FROM users WHERE email = '{{trigger.email}}'

-- ✅ Safe
SELECT * FROM users WHERE email = $1
Parameters: [{{trigger.email}}]
```

2. **Least Privilege**: Grant minimum required permissions
3. **Use SSL**: Always enable SSL for production
4. **Rotate Credentials**: Change passwords regularly
5. **Read-Only Users**: Use read-only users for SELECT queries

### Performance Tips

1. **Use Indexes**: Ensure queries use indexes
```sql
EXPLAIN SELECT * FROM users WHERE email = $1;
```

2. **Limit Results**: Always use LIMIT for large tables
```sql
SELECT * FROM logs ORDER BY created_at DESC LIMIT 100;
```

3. **Batch Operations**: Update multiple rows in single query
```sql
UPDATE users SET status = 'active'
WHERE id = ANY($1::int[]);
```

4. **Connection Pooling**: Reuse connections across flows
5. **Avoid SELECT ***: Only select needed columns

### Data Integrity Tips

1. **Use Transactions**: For multi-step operations
2. **Validate Data**: Check data before inserting
3. **Handle Nulls**: Account for NULL values
4. **Check Constraints**: Respect database constraints
5. **Backup First**: Test destructive operations on copy

### Query Optimization

1. **Analyze Queries**: Use EXPLAIN ANALYZE
2. **Create Indexes**: On frequently queried columns
3. **Avoid N+1 Queries**: Fetch related data in single query
4. **Use JOINs Wisely**: Prefer JOINs over multiple queries
5. **Partition Large Tables**: For better performance

---

## Advanced Patterns

### Upsert (Insert or Update)

```sql
INSERT INTO users (email, name, status)
VALUES ($1, $2, $3)
ON CONFLICT (email)
DO UPDATE SET
  name = EXCLUDED.name,
  status = EXCLUDED.status,
  updated_at = NOW()
```

### Bulk Insert

```sql
INSERT INTO logs (level, message, created_at)
SELECT * FROM unnest(
  $1::text[],
  $2::text[],
  $3::timestamp[]
)
```

### Conditional Updates

```sql
UPDATE users
SET status = CASE
  WHEN last_login < NOW() - INTERVAL '90 days' THEN 'inactive'
  WHEN last_login < NOW() - INTERVAL '30 days' THEN 'dormant'
  ELSE 'active'
END
WHERE status != 'deleted'
```

### Aggregation Queries

```sql
SELECT
  DATE_TRUNC('day', created_at) as date,
  COUNT(*) as count,
  AVG(amount) as avg_amount
FROM orders
WHERE created_at >= $1
GROUP BY DATE_TRUNC('day', created_at)
ORDER BY date DESC
```

---

## Example Workflows

### Daily User Report

```
1. Schedule Trigger (daily at 9 AM)
2. PostgreSQL: Query Rows
   SELECT COUNT(*) as total,
          COUNT(*) FILTER (WHERE status = 'active') as active
   FROM users
3. Email: Send report with results
```

### Sync Data to External System

```
1. Schedule Trigger (every hour)
2. PostgreSQL: Query Rows
   SELECT * FROM orders
   WHERE synced = false
   LIMIT 100
3. HTTP Request: Send to external API
4. PostgreSQL: Update Rows
   UPDATE orders SET synced = true
   WHERE id = ANY($1)
```

### Audit Log Workflow

```
1. Webhook Trigger
2. PostgreSQL: Insert Row
   Table: audit_logs
   Columns:
     user_id: {{trigger.userId}}
     action: {{trigger.action}}
     details: {{trigger.details}}
     ip_address: {{trigger.ip}}
     created_at: {{now}}
```

---

## Limitations

- **Query Timeout**: Maximum 60 seconds per query
- **Result Size**: Maximum 10 MB response
- **Concurrent Connections**: Subject to database limits
- **Supported Versions**: PostgreSQL 9.6 or higher
- **SSL**: Recommended for production use

---

## Related Documentation

- [Core Concepts: Connections](core-concepts.md#connections--authentication)
- [Core Concepts: Data Mapping](core-concepts.md#data-mapping)
- [Troubleshooting: Connection Problems](troubleshooting-hub.md#connectionauth-problems)
- [Security & Privacy](security-privacy.md)
- [Error Reference](error-reference.md)

---

## Need Help?

- **PostgreSQL Docs**: [postgresql.org/docs](https://www.postgresql.org/docs/)
- **SQL Tutorial**: [postgresqltutorial.com](https://www.postgresqltutorial.com)
- **Query Optimization**: [explain.depesz.com](https://explain.depesz.com)
- **Support**: [Contact Support](contact-support.md) with connection details (no passwords!) and error message


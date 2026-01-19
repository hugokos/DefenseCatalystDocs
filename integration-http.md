# HTTP Request Integration

## Overview

The HTTP Request action allows you to make API calls to any web service, giving you unlimited integration possibilities. Perfect for custom APIs, internal services, and any system with an HTTP endpoint.

---

## What It Enables

### Common Use Cases

1. **Custom APIs**: Call your own internal APIs
2. **Third-Party Services**: Integrate with services not in our directory
3. **REST APIs**: Standard GET, POST, PUT, DELETE operations
4. **Webhooks**: Send data to external webhooks
5. **Data Fetching**: Retrieve data from any HTTP endpoint
6. **Authentication**: Support for various auth methods

---

## Prerequisites

- API endpoint URL
- Authentication credentials (if required)
- Understanding of HTTP methods
- API documentation from the service you're calling

---

## How to Use HTTP Request

### Step 1: Add HTTP Request Action

1. In your flow, click "Add Step"
2. Search for "HTTP"
3. Select "HTTP Request" action

### Step 2: Configure Request

#### **Method**

Choose the HTTP method:
- **GET**: Retrieve data
- **POST**: Create new data
- **PUT**: Update existing data
- **PATCH**: Partially update data
- **DELETE**: Remove data
- **HEAD**: Get headers only
- **OPTIONS**: Get supported methods

#### **URL**

Enter the full API endpoint:
```
https://api.example.com/v1/users
```

**Tips**:
- Include protocol (https://)
- Use data picker for dynamic URLs
- URL encode special characters

**Dynamic URL Example**:
```
https://api.example.com/users/{{trigger.userId}}
```

### Step 3: Add Headers (Optional)

Common headers:

**Content-Type**:
```
Content-Type: application/json
```

**Authorization**:
```
Authorization: Bearer {{secrets.apiToken}}
```

**Custom Headers**:
```
X-API-Key: your-api-key
X-Custom-Header: custom-value
```

### Step 4: Add Query Parameters (Optional)

For GET requests with parameters:

**Example**:
```
URL: https://api.example.com/users
Query Params:
  - limit: 10
  - offset: 0
  - status: active
```

**Results in**:
```
https://api.example.com/users?limit=10&offset=0&status=active
```

### Step 5: Add Body (For POST/PUT/PATCH)

#### **JSON Body**:
```json
{
  "name": "{{trigger.name}}",
  "email": "{{trigger.email}}",
  "status": "active"
}
```

#### **Form Data**:
```
name: John Doe
email: john@example.com
```

#### **Raw Text**:
```
Plain text or XML content
```

### Step 6: Configure Authentication

Choose authentication method:

#### **None**
No authentication required

#### **Basic Auth**
```
Username: your-username
Password: your-password
```

#### **Bearer Token**
```
Token: your-bearer-token
```

#### **API Key**
Add as header or query parameter:
```
Header: X-API-Key: your-key
OR
Query: ?api_key=your-key
```

#### **OAuth 2.0**
Use OAuth connection (if supported)

### Step 7: Advanced Options

**Timeout**: Maximum wait time (default: 30 seconds)
```
Timeout: 60
```

**Follow Redirects**: Follow 301/302 redirects (default: true)
```
Follow Redirects: true
```

**Fail on Error**: Fail flow if status code is 4xx or 5xx (default: true)
```
Fail on Error: true
```

### Step 8: Test Request

1. Click "Test Step"
2. Review response
3. Check status code
4. Inspect response body
5. Verify data structure

---

## Response Data

### Success Response

```json
{
  "status": 200,
  "headers": {
    "content-type": "application/json",
    "x-rate-limit-remaining": "99"
  },
  "body": {
    "id": "123",
    "name": "John Doe",
    "email": "john@example.com"
  }
}
```

### Using Response Data

Access response in next steps:
```
{{httpRequest.body.id}}
{{httpRequest.status}}
{{httpRequest.headers['content-type']}}
```

---

## Common Errors & Fixes

### ❌ "Connection timeout"

**Cause**: API is slow or unreachable

**Fix**:
1. Increase timeout value
2. Check API endpoint is correct
3. Verify network connectivity
4. Check API service status
5. Try request in Postman/curl first

---

### ❌ "401 Unauthorized"

**Cause**: Authentication failed

**Fix**:
1. Verify API key/token is correct
2. Check authentication method matches API requirements
3. Ensure token hasn't expired
4. Check header format (Bearer vs Basic)
5. Verify API key has required permissions

**Example Fix**:
```
❌ Wrong: Authorization: your-token
✅ Right: Authorization: Bearer your-token
```

---

### ❌ "400 Bad Request"

**Cause**: Invalid request format

**Fix**:
1. Check request body format (JSON syntax)
2. Verify required fields are included
3. Check data types match API expectations
4. Review API documentation
5. Test with API's example request

**Common Issues**:
- Missing required fields
- Wrong data types (string vs number)
- Invalid JSON syntax
- Incorrect Content-Type header

---

### ❌ "404 Not Found"

**Cause**: Endpoint doesn't exist

**Fix**:
1. Verify URL is correct
2. Check for typos in endpoint path
3. Ensure API version is correct
4. Verify resource ID exists
5. Check API documentation for correct endpoint

---

### ❌ "429 Too Many Requests"

**Cause**: Rate limit exceeded

**Fix**:
1. Slow down request frequency
2. Check rate limit headers
3. Implement retry with backoff
4. Use batch endpoints if available
5. Contact API provider for limit increase

---

### ❌ "500 Internal Server Error"

**Cause**: API server error

**Fix**:
1. Check API service status
2. Retry request after delay
3. Verify request isn't causing server error
4. Contact API support
5. Check API logs if available

---

### ❌ "SSL Certificate Error"

**Cause**: Invalid or self-signed certificate

**Fix**:
1. Verify URL uses https://
2. Check certificate is valid
3. For development: Use http:// (not recommended for production)
4. Contact API provider about certificate

---

## Test Checklist

- [ ] URL is correct and accessible
- [ ] HTTP method is appropriate
- [ ] Headers are properly formatted
- [ ] Authentication works
- [ ] Request body is valid JSON (if applicable)
- [ ] Response status is 2xx
- [ ] Response data structure matches expectations
- [ ] Error handling is configured

---

## Tips & Best Practices

### Security Best Practices

1. **Never Hardcode Secrets**: Use connections or environment variables
2. **Use HTTPS**: Always use secure connections
3. **Validate Responses**: Check status codes before using data
4. **Rate Limiting**: Respect API rate limits
5. **Error Handling**: Handle failures gracefully

### Performance Tips

1. **Timeouts**: Set appropriate timeouts for your use case
2. **Parallel Requests**: Use branches for concurrent calls
3. **Caching**: Cache responses when appropriate
4. **Batch Operations**: Use batch endpoints when available
5. **Compression**: Enable gzip if API supports it

### Debugging Tips

1. **Test Externally First**: Use Postman or curl to verify API works
2. **Check Logs**: Review response body and headers
3. **Incremental Testing**: Start simple, add complexity gradually
4. **Save Examples**: Keep working examples for reference
5. **Monitor Rate Limits**: Check rate limit headers

### API Design Tips

1. **Idempotency**: Design for safe retries
2. **Versioning**: Use versioned API endpoints
3. **Error Messages**: Provide clear error responses
4. **Documentation**: Keep API docs up to date
5. **Status Codes**: Use appropriate HTTP status codes

---

## Advanced Patterns

### Retry Logic

Handle transient failures:
```
1. HTTP Request
2. Branch: Check if status is 5xx
3. If yes: Wait 5 seconds, retry
4. If no: Continue
```

### Pagination

Handle paginated responses:
```
1. HTTP Request (page 1)
2. Loop: While has_more is true
3. HTTP Request (next page)
4. Combine results
```

### Authentication Refresh

Handle token expiration:
```
1. HTTP Request with token
2. Branch: Check if 401
3. If yes: Refresh token, retry
4. If no: Continue
```

### Batch Processing

Process multiple items:
```
1. Loop through items
2. HTTP Request for each
3. Collect responses
4. Handle errors individually
```

---

## Common API Patterns

### REST API

```
GET    /users          # List users
GET    /users/123      # Get user
POST   /users          # Create user
PUT    /users/123      # Update user
DELETE /users/123      # Delete user
```

### GraphQL API

```
Method: POST
URL: https://api.example.com/graphql
Body:
{
  "query": "{ users { id name email } }"
}
```

### SOAP API

```
Method: POST
URL: https://api.example.com/soap
Headers:
  Content-Type: text/xml
Body:
<?xml version="1.0"?>
<soap:Envelope>
  <soap:Body>
    <GetUser>
      <UserId>123</UserId>
    </GetUser>
  </soap:Body>
</soap:Envelope>
```

---

## Example Requests

### GET Request with Query Params

```
Method: GET
URL: https://api.github.com/users/octocat/repos
Headers:
  Accept: application/vnd.github.v3+json
Query Params:
  type: public
  sort: updated
```

### POST Request with JSON

```
Method: POST
URL: https://api.example.com/users
Headers:
  Content-Type: application/json
  Authorization: Bearer {{secrets.token}}
Body:
{
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin"
}
```

### PUT Request with Authentication

```
Method: PUT
URL: https://api.example.com/users/123
Headers:
  Content-Type: application/json
  X-API-Key: {{secrets.apiKey}}
Body:
{
  "status": "active",
  "last_login": "{{now}}"
}
```

### DELETE Request

```
Method: DELETE
URL: https://api.example.com/users/123
Headers:
  Authorization: Bearer {{secrets.token}}
```

---

## Limitations

- **Timeout**: Maximum 300 seconds (5 minutes)
- **Response Size**: Maximum 10 MB response body
- **Redirects**: Maximum 10 redirects followed
- **Concurrent Requests**: Subject to platform limits
- **Rate Limits**: Respect external API rate limits

---

## Related Documentation

- [Core Concepts: Actions](04-core-concepts.md#triggers-vs-actions)
- [Core Concepts: Data Mapping](04-core-concepts.md#data-mapping)
- [Troubleshooting: Connection Problems](07-troubleshooting-hub.md#connectionauth-problems)
- [Error Reference](08-error-reference.md)
- [Security & Privacy](11-security-privacy.md)

---

## Need Help?

- **API Testing**: Use [Postman](https://www.postman.com) or [curl](https://curl.se) to test APIs
- **JSON Validation**: Use [JSONLint](https://jsonlint.com) to validate JSON
- **HTTP Status Codes**: See [HTTP Status Dogs](https://httpstatusdogs.com) for reference
- **Support**: [Contact Support](13-contact-support.md) with your request details and error message

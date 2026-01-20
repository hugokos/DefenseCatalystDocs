# OpenAI Integration

## What It Enables

Integrate AI capabilities into your workflows using OpenAI's powerful models:

- **Text Generation**: Generate content, summaries, responses
- **Chat Completion**: Build conversational workflows
- **Text Analysis**: Sentiment analysis, classification, extraction
- **Code Generation**: Generate code snippets and scripts
- **Translation**: Translate text between languages
- **Data Transformation**: Convert unstructured to structured data

## Prerequisites

- OpenAI account ([platform.openai.com](https://platform.openai.com))
- OpenAI API key with credits
- Understanding of AI model capabilities and limitations

## How to Connect

### Step 1: Get OpenAI API Key

1. Go to [platform.openai.com](https://platform.openai.com)
2. Sign in or create account
3. Navigate to API Keys section
4. Click "Create new secret key"
5. Copy the key (starts with `sk-`)
6. **Important**: Save it securely - you won't see it again!

### Step 2: Add OpenAI Action

1. In your flow, click "+" to add a step
2. Search for "OpenAI"
3. Select the action you want (e.g., "Ask ChatGPT")

### Step 3: Connect with API Key

1. Click "Connect" or "+ New Connection"
2. Paste your OpenAI API key
3. Click "Save"

### Step 4: Configure Action

1. Select model (GPT-4, GPT-3.5, etc.)
2. Write your prompt
3. Configure parameters (temperature, max tokens)
4. Map data from previous steps

### Step 5: Test

1. Click "Test" to send request
2. Review AI response
3. Adjust prompt if needed

## Available Actions

### Ask ChatGPT
**What**: Send a prompt and get AI-generated response
**Use Cases**:
- Generate content
- Answer questions
- Summarize text
- Extract information

**Configuration**:
- **Model**: gpt-4, gpt-3.5-turbo, etc.
- **Prompt**: Your instruction to the AI
- **Temperature**: Creativity (0-2, default 0.7)
- **Max Tokens**: Response length limit

**Example Prompt**:
```
Summarize the following customer feedback in 2-3 sentences:

{{trigger.feedback}}
```

### Chat Completion
**What**: Multi-turn conversation with context
**Use Cases**:
- Conversational workflows
- Context-aware responses
- Multi-step reasoning

**Configuration**:
- **Messages**: Array of conversation history
- **System Message**: AI behavior instructions
- **User Message**: Current user input

**Example**:
```json
System: "You are a helpful customer service assistant."
User: "{{trigger.question}}"
```

### Text Completion (Legacy)
**What**: Complete text based on prompt
**Note**: Deprecated, use Chat Completion instead

### Generate Image (DALL-E)
**What**: Create images from text descriptions
**Use Cases**:
- Generate illustrations
- Create marketing visuals
- Prototype designs

**Configuration**:
- **Prompt**: Image description
- **Size**: 256x256, 512x512, 1024x1024
- **Number**: How many images (1-10)

### Transcribe Audio (Whisper)
**What**: Convert audio to text
**Use Cases**:
- Transcribe meetings
- Process voice messages
- Create captions

**Configuration**:
- **Audio File**: URL or file data
- **Language**: Optional language hint

### Moderate Content
**What**: Check content for policy violations
**Use Cases**:
- Filter user-generated content
- Compliance checking
- Safety screening

**Returns**: Flagged categories and scores

## Model Selection

### GPT-4 Turbo
- **Best for**: Complex reasoning, accuracy
- **Cost**: Higher
- **Speed**: Moderate
- **Context**: 128K tokens

### GPT-4
- **Best for**: High-quality outputs
- **Cost**: Higher
- **Speed**: Slower
- **Context**: 8K tokens

### GPT-3.5 Turbo
- **Best for**: Fast, cost-effective tasks
- **Cost**: Lower
- **Speed**: Fast
- **Context**: 16K tokens

### Choosing a Model
- **Simple tasks**: GPT-3.5 Turbo
- **Complex reasoning**: GPT-4
- **Long documents**: GPT-4 Turbo
- **Budget-conscious**: GPT-3.5 Turbo

## Prompt Engineering Tips

### Be Specific
❌ "Write about customer service"
✅ "Write a 3-paragraph email responding to a customer complaint about late delivery"

### Provide Context
```
You are a technical support specialist.
A customer reports: {{trigger.issue}}
Write a helpful response that:
1. Acknowledges the issue
2. Provides troubleshooting steps
3. Offers escalation if needed
```

### Use Examples
```
Extract the name and email from this text.

Example:
Input: "Contact John Doe at john@example.com"
Output: {"name": "John Doe", "email": "john@example.com"}

Now extract from:
{{trigger.text}}
```

### Set Output Format
```
Analyze this feedback and respond in JSON format:
{
  "sentiment": "positive|negative|neutral",
  "category": "product|service|pricing",
  "priority": "high|medium|low",
  "summary": "brief summary"
}

Feedback: {{trigger.feedback}}
```

### Control Creativity
- **Temperature 0**: Deterministic, consistent
- **Temperature 0.7**: Balanced (default)
- **Temperature 1.5**: Creative, varied

## Common Errors & Fixes

### "Invalid API key"
**Cause**: API key incorrect or expired
**Fix**:
1. Verify API key is correct
2. Check key hasn't been revoked
3. Generate new key if needed
4. Update connection in Defense Catalyst

### "Rate limit exceeded"
**Cause**: Too many requests per minute
**Fix**:
1. Reduce flow execution frequency
2. Add delays between requests
3. Upgrade OpenAI plan for higher limits
4. Implement retry logic with backoff

### "Insufficient quota"
**Cause**: No credits remaining in OpenAI account
**Fix**:
1. Check OpenAI billing dashboard
2. Add credits to account
3. Set up auto-recharge
4. Monitor usage regularly

### "Context length exceeded"
**Cause**: Prompt + response exceeds model limit
**Fix**:
1. Shorten your prompt
2. Reduce max_tokens setting
3. Use model with larger context (GPT-4 Turbo)
4. Split into multiple requests

### "Content policy violation"
**Cause**: Prompt or response violates OpenAI policies
**Fix**:
1. Review OpenAI usage policies
2. Modify prompt to avoid sensitive topics
3. Use content moderation action first
4. Implement input filtering

### "Model not found"
**Cause**: Model name incorrect or deprecated
**Fix**:
1. Check current model names in OpenAI docs
2. Update to supported model
3. Use gpt-3.5-turbo or gpt-4 as safe defaults

## Test Checklist

- [ ] API key is valid
- [ ] Model is appropriate for task
- [ ] Prompt is clear and specific
- [ ] Temperature setting is correct
- [ ] Max tokens allows full response
- [ ] Response format matches expectations
- [ ] Cost per request is acceptable
- [ ] Error handling is in place

## Tips & Best Practices

### Cost Management
- **Monitor usage**: Check OpenAI dashboard regularly
- **Set limits**: Configure spending limits in OpenAI
- **Choose wisely**: Use GPT-3.5 when GPT-4 isn't needed
- **Limit tokens**: Set max_tokens to prevent runaway costs
- **Cache results**: Store responses to avoid duplicate requests

### Performance
- **Shorter prompts**: Faster responses, lower cost
- **Appropriate model**: Don't use GPT-4 for simple tasks
- **Parallel requests**: Process multiple items efficiently
- **Streaming**: Use streaming for real-time responses (advanced)

### Reliability
- **Handle errors**: Always have fallback logic
- **Retry logic**: Implement exponential backoff
- **Validate responses**: Check AI output before using
- **Set timeouts**: Don't wait indefinitely
- **Monitor quality**: Review outputs regularly

### Security
- **Sanitize inputs**: Clean user data before sending
- **Don't send secrets**: Never include API keys, passwords
- **Validate outputs**: Don't trust AI responses blindly
- **Audit logs**: Track what data is sent to OpenAI
- **Compliance**: Ensure data handling meets requirements

### Prompt Quality
- **Test iteratively**: Refine prompts based on results
- **Use system messages**: Set AI behavior consistently
- **Provide examples**: Few-shot learning improves accuracy
- **Request structured output**: JSON, CSV, etc.
- **Version prompts**: Track what works

## Advanced Patterns

### Structured Data Extraction
```
Extract information from this text and return as JSON:

Required fields:
- name (string)
- email (string)
- phone (string or null)
- company (string or null)

Text: {{trigger.text}}

Return only valid JSON, no explanation.
```

### Multi-step Reasoning
1. **Step 1**: Analyze input with GPT-4
2. **Step 2**: Use analysis to generate response
3. **Step 3**: Validate response with another call

### Content Generation Pipeline
1. **Generate outline**: Create structure
2. **Expand sections**: Generate detailed content
3. **Review & edit**: Polish with another prompt
4. **Format**: Convert to desired format

### Sentiment Analysis
```
Analyze the sentiment of this customer feedback.

Feedback: {{trigger.feedback}}

Respond with only one word: POSITIVE, NEGATIVE, or NEUTRAL
```

### Translation Workflow
```
Translate the following text from {{trigger.source_lang}} to {{trigger.target_lang}}.

Maintain the tone and style. If technical terms exist, keep them in original language.

Text: {{trigger.text}}
```

## Token Usage & Costs

### Understanding Tokens
- ~4 characters = 1 token
- ~750 words = 1000 tokens
- Both prompt and response count

### Estimating Costs
- GPT-3.5 Turbo: $0.0015 per 1K input tokens, $0.002 per 1K output
- GPT-4: $0.03 per 1K input tokens, $0.06 per 1K output
- GPT-4 Turbo: $0.01 per 1K input tokens, $0.03 per 1K output

### Cost Optimization
- Use GPT-3.5 for simple tasks (20x cheaper)
- Limit max_tokens to what you need
- Cache responses when possible
- Batch similar requests

## Limitations

### Rate Limits (varies by plan)
- **Free tier**: 3 requests/minute
- **Pay-as-you-go**: 3,500 requests/minute (GPT-3.5)
- **Pay-as-you-go**: 10,000 requests/minute (GPT-4)

### Context Limits
- **GPT-3.5 Turbo**: 16K tokens
- **GPT-4**: 8K tokens
- **GPT-4 Turbo**: 128K tokens

### Response Time
- Typically 1-5 seconds
- Longer for complex prompts
- Varies by model and load

## Related Documentation

- [Core Concepts: Data Mapping](core-concepts.md#data-mapping)
- [Troubleshooting: Rate Limits](troubleshooting-hub.md#rate-limits--timeouts)
- [Error Reference](error-reference.md)
- [Limits & Reliability](limits-reliability.md)

## Example Use Cases

### Customer Support Automation
Webhook → OpenAI (analyze issue) → Route to appropriate team

### Content Generation
Schedule → OpenAI (generate post) → Post to social media

### Data Enrichment
New record → OpenAI (extract/categorize) → Update database

### Email Response
Email received → OpenAI (draft response) → Send for approval

### Document Summarization
File uploaded → OpenAI (summarize) → Send summary via Slack

## Need Help?

- Check [OpenAI Documentation](https://platform.openai.com/docs)
- Review [Troubleshooting Hub](troubleshooting-hub.md)
- Contact [Support](contact-support.md)
- Join community discussions


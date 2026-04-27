# Domain 4 — Prompt Engineering & Structured Output

**Exam Weight: 20%**

This domain tests your ability to craft prompts that produce reliable, structured, and consistent output in production systems. The exam focuses on techniques that hold up at scale — not clever one-liners, but repeatable architectural patterns.

---

## Topics to Cover

### 4.1 Prompt Engineering Fundamentals
- System prompts vs. user prompts — what goes where and why
- Role assignment and persona prompting
- Being specific: the difference between vague instructions and precise behavioural constraints
- Positive framing ("always return JSON") vs. negative framing ("never return prose")
- Temperature and its effect on output consistency

### 4.2 Structured Output Patterns
- JSON schema-based output: defining the exact shape you expect
- Using `response_format` to enforce structured output
- XML tags for sectioning complex responses
- When to use JSON vs. XML vs. markdown in your output schema
- Validating structured output after the API call — never assume it's correct

### 4.3 Few-Shot Prompting
- What few-shot examples actually do: they give Claude a concrete pattern to follow
- How many examples is enough? The rule of 3–4 for stable extraction tasks
- Example quality matters more than quantity: bad examples actively mislead
- Constructing examples that show the issue, location, and fix — not just the answer
- Negative examples: showing Claude what NOT to produce

### 4.4 Self-Correction & Validation Loops
- JSON schema + retry loop: Claude receives its own error message and regenerates
- How to pass validation errors back to Claude in a way it can act on
- Limiting retry attempts to prevent infinite loops
- When to give up and escalate vs. retry

### 4.5 Chain-of-Thought & Reasoning
- `<thinking>` blocks: asking Claude to reason before answering
- Extended thinking (when available) and its effect on accuracy
- When chain-of-thought helps (complex multi-step reasoning) vs. hurts (simple classification)
- Hiding reasoning from end users while still benefiting from it

### 4.6 Prompt Caching
- What prompt caching is and when it applies
- Cache breakpoints: where Claude stores the cache checkpoint
- Designing prompts to maximise cache hits: stable content first, variable content last
- Cost savings from caching: ~90% reduction on cached tokens
- What invalidates a cache (model change, content change, TTL expiry)

### 4.7 Data Extraction Patterns
- Extracting structured data from unstructured documents (PDFs, emails, clinical notes)
- Handling missing fields gracefully: null vs. default vs. error
- Multi-document extraction: extracting the same schema from many documents consistently
- Confidence scoring: asking Claude to rate its own extraction confidence

---

## Hands-On Projects

### 📄 Project 1 — Clinical Document Extraction Pipeline

Build a structured data extraction system for NHS-style clinical documents:

- Accept unstructured clinical notes as input (free text)
- Define a JSON schema for extracted fields: patient_id, diagnosis_codes, medications, follow_up_date, risk_flags
- Use few-shot examples (at least 3) to establish the extraction pattern
- Implement a validation loop: if the JSON is invalid or missing required fields, pass the error back to Claude and retry (max 3 attempts)
- Log extraction confidence scores alongside each result
- Handle edge cases: missing patient ID, ambiguous dates, unknown medication names

**What you'll learn:** Few-shot prompting, JSON schema validation, self-correction loops, structured extraction at scale

**Stretch goal:** Add a second pass that uses a separate Claude call to cross-check the extracted diagnosis codes against a known ICD-10 list and flag any that don't match.

---

### 💬 Project 2 — Reliable Structured Chatbot with Prompt Caching

Build a customer-facing chatbot that returns consistently structured responses:

- Define a response schema: `{ intent, response_text, suggested_actions[], confidence, needs_human: bool }`
- Every API response must validate against this schema — implement a retry loop for failures
- Use XML tags to separate reasoning (`<thinking>`) from the final response
- Implement prompt caching: the system prompt and few-shot examples should be cached, only the user message should be variable
- Track cache hit rate across 20 test queries and demonstrate cost savings
- Write a test suite with 10 edge-case inputs that verify the schema is always returned correctly

**What you'll learn:** Output schema enforcement, prompt caching design, thinking blocks, cost optimisation

**Stretch goal:** Add a second model call that takes the `<thinking>` block and generates a plain-English explanation of why Claude made the decision it did — without exposing the raw reasoning to the end user.

---

## Folder Structure (for contributors)

```
domain-4-prompt-engineering/
├── README.md           ← this file
├── version-a/          ← Contributor A's course
│   ├── lessons/
│   ├── exercises/
│   └── solutions/
└── version-b/          ← Contributor B's course
    ├── lessons/
    ├── exercises/
    └── solutions/
```

## Key Anti-Patterns to Teach (exam traps)

- Putting variable content before stable content — destroys cache hit rate
- Using 1 example when 3–4 are needed — insufficient for reliable pattern matching
- Not validating structured output — assuming Claude always returns valid JSON
- Infinite retry loops with no exit condition — always cap retries
- Hiding schema requirements in the user message instead of the system prompt
- Using chain-of-thought for simple tasks — adds cost without accuracy benefit

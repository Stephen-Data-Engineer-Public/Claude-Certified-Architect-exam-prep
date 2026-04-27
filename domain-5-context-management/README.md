# Domain 5 — Context Management & Reliability

**Exam Weight: 15%**

This domain tests your understanding of the context window as a finite, expensive resource — and your ability to design systems that use it wisely. It ties together everything from the other domains: agents, tools, prompts, and MCP all interact with context. Getting this wrong breaks reliability at scale.

---

## Topics to Cover

### 5.1 The Context Window
- What the context window is and why it's finite
- Token counting: how messages, tool definitions, tool results, and system prompts all consume tokens
- Context window sizes across Claude models (Sonnet, Haiku, Opus) and when to choose each
- What happens when you hit the context limit: truncation behaviour and why it's dangerous

### 5.2 Context Isolation in Multi-Agent Systems
- Context leakage: when a subagent receives information it shouldn't have
- Why passing the full coordinator context to every subagent is an anti-pattern
- Techniques for scoping context: summarise before passing, extract only relevant fields, use `context: fork`
- Token economics: every token in a subagent's context costs money and slows response time

### 5.3 Long Document Handling
- Strategies for working with documents that exceed the context window
- Chunking: splitting documents into overlapping segments
- Retrieval-Augmented Generation (RAG): retrieving only the relevant chunks
- Summarisation chains: progressively summarising long content
- When to use each strategy (exam tests this decision-making)

### 5.4 Prompt Caching for Context Efficiency
- Cache design: placing stable context (system prompt, examples, documents) before variable content
- The 1024-token minimum for caching to activate
- Cache TTL: how long cached content lasts and what triggers expiry
- Measuring cache effectiveness: `cache_read_input_tokens` vs. `cache_creation_input_tokens` in the API response

### 5.5 Context Compaction
- What context compaction is: automatically summarising older turns to free up context
- When to trigger compaction: proactively (on a schedule) vs. reactively (when approaching the limit)
- What is lost during compaction and how to preserve critical information
- Compaction in Claude Code: the `/compact` command and its effect on agentic sessions

### 5.6 Reliability Patterns
- Idempotent tool calls: designing tools so re-running them doesn't cause double side effects
- Checkpoint patterns: saving progress so a crashed agent can resume without starting over
- Timeout handling: what to do when a tool call or subagent takes too long
- Graceful degradation: returning a partial result rather than failing completely

### 5.7 Observability (Beyond the Exam)
- Note: the exam covers error propagation but not full observability — this section prepares you for production
- Logging tool calls, token usage, and latency per agent turn
- Identifying slow subagents and silently failing tools
- Building a simple dashboard over your agent's behaviour

---

## Hands-On Projects

### 📊 Project 1 — Long Document Analysis with RAG

Build a system that answers questions over a large document collection (e.g., a set of NHS policy PDFs):

- Ingest at least 5 documents that together exceed the context window
- Chunk each document with overlapping windows (implement two chunking strategies and compare)
- Store chunks in a vector store (use a simple in-memory solution or ChromaDB)
- On each query, retrieve the top-k relevant chunks and inject only those into the Claude context
- Measure token usage with and without RAG — demonstrate the savings
- Handle the case where no relevant chunks are found gracefully

**What you'll learn:** RAG architecture, chunking strategies, context window measurement, token efficiency

**Stretch goal:** Add a re-ranking step that uses a second Claude call to score each retrieved chunk for relevance before injecting — so only the truly relevant context reaches the main call.

---

### 🔁 Project 2 — Resilient Agent with Checkpointing

Build a long-running agent that can survive a crash and resume from where it left off:

- The agent processes a list of 20 tasks sequentially (e.g., summarising 20 documents)
- After completing each task, it writes a checkpoint to a JSON file: `{ completed: [], pending: [], results: {} }`
- If the agent is interrupted (simulate with `Ctrl+C` or a `KeyboardInterrupt`), it saves its state before exiting
- On restart, it reads the checkpoint and continues from the next pending task — no re-processing completed tasks
- Implement context compaction: after every 5 tasks, summarise the session and reset the message history with the summary as the new context
- Track total token usage across the full run and log it at the end

**What you'll learn:** Checkpointing, context compaction, graceful shutdown, token tracking across a session

**Stretch goal:** Add idempotency to each task: if a task's result already exists in the checkpoint, skip the API call entirely — making the agent safe to re-run multiple times without wasting tokens or money.

---

## Folder Structure (for contributors)

```
domain-5-context-management/
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

- Passing the full coordinator context to subagents — context leakage + wasted tokens
- Not placing stable content before variable content in cached prompts
- Chunking documents without overlap — loses meaning at chunk boundaries
- Not implementing checkpoints for long-running agents — a crash means starting over
- Assuming compaction is lossless — always explicitly preserve critical state before compacting
- Ignoring `cache_read_input_tokens` in API responses — you can't optimise what you don't measure

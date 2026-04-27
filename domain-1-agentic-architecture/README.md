# Domain 1 — Agentic Architecture & Orchestration

**Exam Weight: 27% — the highest weighted domain**

This domain tests your ability to design, build, and debug multi-agent systems using the Claude Agent SDK. It is the most heavily tested area and the one where architectural judgment matters most. Every other domain feeds into this one.

---

## Topics to Cover

### 1.1 The Agentic Loop
- The complete lifecycle of a Claude API call: sending messages, receiving a response, handling `stop_reason`
- The three `stop_reason` values: `end_turn`, `tool_use`, `max_tokens` — and what each means for your loop
- How to append tool results back into the message array correctly
- Anti-patterns: natural language termination, arbitrary iteration caps, treating text content as completion signal

### 1.2 Tool Use & Decision-Making
- Defining tools with JSON schemas
- How Claude decides when and whether to call a tool
- Forcing tool use vs. letting Claude decide (`tool_choice`)
- Handling tool errors gracefully inside the loop

### 1.3 Multi-Agent Orchestration
- Hub-and-spoke architecture: one coordinator, multiple specialist subagents
- When to use subagents vs. keeping logic in the coordinator
- Task decomposition patterns: breaking a complex task into parallelisable subtasks
- Passing context between agents without leaking unnecessary tokens

### 1.4 The Claude Agent SDK
- `Agent`, `Task`, and `Runner` primitives
- Lifecycle hooks: `on_tool_call`, `on_tool_result`, `on_message`
- How hooks differ from tools — and when to use each
- Subagent delegation: `context: fork` and isolated execution

### 1.5 Orchestration Guardrails
- Preventing infinite loops: token budgets, turn limits, and graceful exits
- Escalation patterns: when should an agent hand back to a human?
- Valid vs. invalid escalation triggers (this is directly tested)
- Error propagation across agent boundaries

### 1.6 Session & State Management
- Stateless vs. stateful agents
- How to persist state between turns without inflating context
- Checkpointing long-running agentic workflows

---

## Hands-On Projects

### 🏗️ Project 1 — Customer Support Resolution Agent

Build a multi-agent customer support system with the following architecture:

- **Coordinator agent** that receives a customer query, classifies its intent, and routes it
- **Specialist subagents** for: billing disputes, technical issues, and account changes
- **Escalation logic** that detects when no subagent can resolve the issue and flags for human review
- A working agentic loop with correct `stop_reason` handling
- Lifecycle hooks that log every tool call and result to a file

**What you'll learn:** Hub-and-spoke design, task decomposition, escalation patterns, lifecycle hooks

**Stretch goal:** Add a memory subagent that stores resolved cases and retrieves similar past cases to help the coordinator decide routing.

---

### 🔬 Project 2 — Multi-Agent Research Pipeline

Build an automated research pipeline that:

- Takes a research question as input
- Uses a **planner agent** to break it into 3–5 sub-questions
- Spawns **parallel researcher subagents** (one per sub-question) that each call a web search tool
- Uses a **synthesis agent** to combine findings into a structured report
- Implements token isolation between subagents so each has only the context it needs

**What you'll learn:** Parallel orchestration, context isolation, token economics, task decomposition at scale

**Stretch goal:** Add a **critic agent** that reviews the synthesised report, scores it for completeness, and sends it back to the planner if it falls below a threshold — creating a self-improving loop.

---

## Folder Structure (for contributors)

```
domain-1-agentic-architecture/
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

- Using `if response.text` to detect completion instead of checking `stop_reason`
- Not appending tool results before the next API call
- Passing the entire coordinator context into every subagent
- Using pre-configured decision trees instead of letting Claude drive orchestration
- Setting a fixed `max_turns` of 1 when the task requires iteration

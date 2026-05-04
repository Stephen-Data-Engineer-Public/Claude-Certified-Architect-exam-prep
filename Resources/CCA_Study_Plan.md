# Claude Certified Architect (CCA-F) — 90-Hour Study Plan

> **Exam:** 60 questions · 120 minutes · Proctored · $99 (free via Claude Partner Network)  
> **Who this is for:** Complete beginners to Claude and AI development — no prior API or agentic system experience assumed  
> **Structure:** Beginner → Intermediate → Advanced, ordered strictly by complexity and dependency  
> **Rule:** Complete each phase fully before moving to the next — later phases build directly on earlier ones  
> **Note on time estimates:** Every estimate below includes reading time, exercise time, debugging time, and re-reading when something doesn't click.

---

## Exam Domains & Hour Allocation

| Domain | Exam Weight | Hours Allocated |
|---|---|---|
| Agentic Architecture & Orchestration | 27% | 22h |
| Claude Code Configuration & Workflows | 20% | 18h |
| Prompt Engineering & Structured Output | 20% | 16h |
| Tool Design & MCP Integration | 18% | 16h |
| Context Management & Reliability | 15% | 10h |
| Practice Questions & Exam Drill | — | 8h |
| **Total** | **100%** | **90h** |

---

## Confirmed Exam Focus Areas

These topics appear repeatedly in accounts from candidates who have already sat the exam. Keep them in mind throughout — every resource and project below maps back to at least one of these.

- `[Agentic Architecture]` Fallback loop design — what happens when a subagent fails or returns nothing
- `[Agentic Architecture]` Multi-instance review — why independent instances catch more errors than self-review
- `[Agentic Architecture]` Orchestrator vs subagent responsibility boundaries
- `[Prompt Engineering]` JSON schema structuring to prevent hallucinations
- `[Prompt Engineering]` Batch API cost optimisation
- `[Tool Design & MCP]` MCP tool orchestration and tool description quality
- `[Tool Design & MCP]` stdio vs Streamable HTTP transport — when to use each
- `[Context Management]` Attention dilution in large contexts and multi-pass review as the architectural solution
- `[Claude Code]` CLAUDE.md hierarchy — which scope wins when configurations conflict
- `[Claude Code]` Hooks (pre/post-execution) — event model and configuration

---

## Phase 1 — Beginner · ~22 hours

> **Goal:** Build the mental model before touching any code. Understand what Claude is, how it reasons, where and why it fails, which model to use for which task, and how to write prompts that produce consistent results. Most exam failures trace back to gaps formed here by people who rushed to the technical phases too quickly.

---

### 1.1 How Claude Actually Works · ~4 hours

**Start here before anything else.** The exam uses Anthropic's own terminology throughout. If you learn vocabulary from third-party sources and never verify it against the official docs, you will misread scenario questions under exam pressure.

---

**AI Capabilities & Limitations** · Anthropic Academy · ~1h · 🆓  
`[Prompt Engineering]` `[Context Management]`

How large language models actually work — real capabilities, operational limits, the mechanics of hallucination, attention behaviour across long contexts, and why models fail in predictable ways. This course defines the vocabulary the entire exam is built on. Do not skip it.

→ https://anthropic.skilljar.com

---

**AI Fluency Foundations** · Anthropic Academy · 4h (videos + exercises) · 🆓  
`[Prompt Engineering]`

The 4D Framework: Delegation, Description, Discernment, Diligence. Covers responsible AI collaboration, the conceptual model behind how Claude processes instructions, and how to think about AI tasks in terms of what should be delegated vs retained by the human. Foundational thinking before any technical work.

→ https://anthropic.skilljar.com

---

**Claude 101** · Anthropic Academy · 3h (videos + exercises) · 🆓  
`[Prompt Engineering]` `[Context Management]`

Claude usage patterns, projects, artifacts, connectors, skills, and research mode. The operational baseline every exam question assumes throughout. Run through the exercises in the actual Claude interface — reading without doing leaves gaps.

→ https://anthropic.skilljar.com

---

### 1.2 Model Selection — Which Claude for Which Task · ~2 hours

> Why this is here: model selection is confirmed exam territory and is almost always omitted from study plans. Cost vs capability tradeoffs, when to use Haiku vs Sonnet vs Opus, and how model choice interacts with context window size and latency requirements — these are architecture decisions the exam tests.

---

**Models Overview** · Anthropic Docs · ~1h reading · 🆓  
`[Prompt Engineering]` `[Context Management]` `[Agentic Architecture]`

Model comparison: capability, context window sizes, cost per token, and recommended use cases. Pay specific attention to the guidance on routing tasks to the most cost-appropriate model within a multi-agent system — that is where this knowledge intersects with agentic architecture questions.

→ https://docs.claude.com/en/docs/about-claude/models

---

**API Reference — Token Usage & Pricing** · Anthropic Docs · ~30 min · 🆓  
`[Prompt Engineering]` `[Context Management]`

Input vs output token pricing, how prompt caching affects cost calculations, and how Batch API pricing differs from synchronous calls. Batch API cost optimisation is a confirmed exam topic.

→ https://docs.claude.com/en/api

---

### 1.3 Prompt Engineering — The Reliability Layer · ~8 hours

> Why prompt engineering comes before the API: you need to understand what a reliable, well-structured output looks like before you can build systems that enforce it programmatically. Skipping to the API first produces code that works in demos and fails in production — which is exactly what the exam tests.

---

**Prompt Engineering Overview** · Anthropic Docs · ~2h reading (read every sub-page) · 🆓  
`[Prompt Engineering]`

Chain-of-thought, few-shot examples, XML structuring, system prompt vs user prompt separation, positive and negative examples, and how Claude processes ambiguous instructions. The exam uses Anthropic's own terminology exclusively — if you have learned prompt engineering elsewhere, cross-check every term here before the exam.

→ https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/overview

---

#### Hands-On Project — Prompt Reliability Experiment · ~3h

`[Prompt Engineering]`

No code required. Use the Claude.ai interface only.

Write 10 prompts targeting the same output — a structured summary of a document you choose. Each prompt must use a different technique: plain instruction, XML tags, few-shot examples, chain-of-thought, role assignment, negative constraints, step-by-step decomposition, and combinations of the above. Run each prompt 5 times. Record which structures produce consistent results and which produce variance.

Write a one-page document of your findings before moving on. The exam tests your ability to choose the right prompting technique for a given reliability requirement — this experiment builds that intuition before you ever write a line of code.

---

### 1.4 Context Management — The Constraints Layer · ~4 hours

> Why before the API: every API architecture decision — how to split tasks, when to cache, how to handle long documents — is constrained by context window behaviour. Understanding the container before you fill it prevents you from designing systems that fail at scale.

---

**Context Windows & Prompt Caching** · Anthropic Docs · ~1.5h reading · 🆓  
`[Context Management]`

Context limits per model, prompt caching eligibility rules (minimum token thresholds, cache lifetime of 5 minutes), cost implications of different context architectures, and how extended thinking interacts with context consumption. Memorise the caching eligibility rules — token minimums and cache lifetime are confirmed exam details.

→ https://docs.claude.com/en/docs/build-with-claude/prompt-caching

---

**Extended Thinking** · Anthropic Docs · ~30 min · 🆓  
`[Context Management]` `[Prompt Engineering]`

When extended thinking helps, when it doesn't, how it consumes tokens, and how it interacts with structured output requirements. Extended thinking appears in exam questions about reliability and output quality.

→ https://docs.claude.com/en/docs/build-with-claude/extended-thinking

---

### 1.5 Phase 1 Consolidation · ~1 hour

Before moving to Phase 2, answer these from memory without looking anything up. If you cannot answer any of them, re-read the relevant doc before continuing.

- What are the four parts of the 4D Framework and what does each one govern?
- What is the difference between a system prompt and a user prompt in terms of how Claude weights them?
- Why does prompt caching have a minimum token threshold? What is the cache lifetime?
- When would you route a task to Haiku instead of Sonnet in a production system?
- What is attention dilution and why does it matter for long-context tasks?
- Name three prompting techniques and describe the specific reliability problem each one solves.

---

## Phase 2 — Intermediate · ~38 hours

> **Goal:** Build real working systems with the Claude API, MCP, and Claude Code. By the end of this phase you will have a working MCP server with three tools, a structured output pipeline with validation loops, and Claude Code running on a real codebase with hooks and CLAUDE.md configured. Every project here directly targets confirmed exam topics.

---

### 2.1 The Claude API — Your Production Foundation · ~12 hours

> The single most important course in the entire plan. The exam is an architecture exam. You cannot answer architecture questions without understanding how the API behaves under production conditions — streaming, error states, tool calling, batching, and caching.

---

**Building with the Claude API** · Anthropic Academy · 8h (videos) + 4h (exercises) = ~12h · 🆓  
`[Prompt Engineering]` `[Context Management]` `[Agentic Architecture]`

Full API lifecycle: streaming, tool use, structured output, prompt caching, extended thinking, Batch API cost optimisation, and production deployment patterns. This course maps directly to three exam domains. Treat the exercise time as non-negotiable — running the code, hitting errors, and fixing them is where the exam-relevant understanding forms.

Modules to prioritise if time is tight: tool use, structured output with validation, prompt caching, and Batch API. These four modules have the most confirmed exam coverage.

→ https://anthropic.skilljar.com

---

**claude-quickstarts** · Anthropic GitHub · ~2h study · 🆓  
`[Prompt Engineering]` `[Agentic Architecture]`

Two quickstarts worth studying at source-code level:

- Customer support agent: tool use with a knowledge base, handling empty tool results, fallback when the knowledge base has no answer
- Financial data analyst: structured output with interactive visualisation, how malformed responses are caught and retried

Read the source code for how they handle failure states — not just how they work when everything goes right. That is what the exam tests.

→ https://github.com/anthropics/claude-quickstarts

---

#### Hands-On Project — Structured Output Pipeline with Validation Loop · ~8h

`[Prompt Engineering]` `[Context Management]`

> Why 8 hours, not 6: the first two hours will be setup, schema design decisions, and your first working call. The next two hours will be debugging the validation loop edge cases — what happens when Claude returns valid JSON that fails schema validation vs invalid JSON entirely are different failure modes requiring different handling. The final four hours are the Batch API integration, comparison logging, and documentation.

Build a Python script that:

- Calls the Claude API and enforces a strict JSON schema on every response using Pydantic
- Schema must include at least: one string, one integer, one enum, one array, and one nested object with its own validation rules
- Validation loop: on schema failure, retry automatically with an error-correction prompt that tells Claude exactly which field failed and why — not a generic "try again"
- Hard limit of 3 retries — after which the pipeline returns a structured error object (not an exception) that downstream code can handle
- Route retries to a smaller model (Haiku) after the first failure to reduce cost — document whether output quality degrades
- Batch API implementation: run 20 simultaneous requests and log the cost difference vs sequential calls
- Final output: a one-page document comparing which schema structures most reliably prevented hallucinations across your test runs

This project covers JSON schema design, validation loop architecture, fallback strategy, model routing by cost, and Batch API — five confirmed exam areas in a single build.

**Tools:** Python · `anthropic` SDK · Pydantic

---

### 2.2 Tool Design & MCP Integration · ~14 hours

> Build before you read further. The MCP protocol only makes sense once you have touched the JSON-RPC messages yourself. The official weather server tutorial takes 90 minutes. Do it before reading anything else in this section.

---

**Introduction to Model Context Protocol** · Anthropic Academy · ~2h · 🆓  
`[Tool Design & MCP]`

Three core primitives: tools (model-controlled functions), resources (read-only data), prompts (reusable templates). Complete the weather server exercise from the course before moving on — it is the reference implementation every other MCP resource assumes you have already built.

→ https://anthropic.skilljar.com

---

**Build an MCP Server** · modelcontextprotocol.io · Official spec · ~1h · 🆓  
`[Tool Design & MCP]`

The canonical weather server tutorial. Build it exactly as documented. Then read the transport specification page immediately after. The distinction between stdio (local subprocess) and Streamable HTTP (network/remote) is a confirmed exam topic and the official spec page is the only source that explains the tradeoffs correctly.

→ https://modelcontextprotocol.io/docs/develop/build-server

---

**Claude Code MCP Integration Docs** · code.claude.com · ~1h reading · 🆓  
`[Tool Design & MCP]` `[Claude Code]`

Project-scoped vs user-scoped MCP servers, the `.mcp.json` format, tool search (lazy loading of tool definitions to preserve context), elicitation dialogs, and the `headersHelper` pattern. These are Claude Code-specific MCP behaviours that differ from Claude Desktop — the exam distinguishes between them.

→ https://code.claude.com/docs/en/mcp

---

**Build MCP Server with Python, Docker & Claude Code** · freeCodeCamp · ~1.5h · 🆓  
`[Tool Design & MCP]`

The most thorough third-party MCP build tutorial available. Covers the security vulnerabilities most tutorials skip (MCP tool poisoning, prompt injection via tool results), Docker packaging for production deployment, Claude Code integration via `/mcp`, and the full JSON-RPC message flow. Read the security section even if you skim the rest — it covers CVEs from real incidents.

→ https://www.freecodecamp.org/news/how-to-build-an-mcp-server-with-python-docker-and-claude-code

---

**MCP: Advanced Topics** · Anthropic Academy · ~1.5h · 🆓  
`[Tool Design & MCP]` `[Agentic Architecture]`

Sampling (server-initiated model calls — the MCP primitive most candidates misunderstand), transport mechanisms, notifications, and file system access for production servers. Take the intro course first. The sampling primitive is how MCP servers can themselves trigger Claude — this appears in agentic architecture exam questions, not just MCP questions.

→ https://anthropic.skilljar.com

---

#### Hands-On Project — Production MCP Server with 3 Tools · ~8h

`[Tool Design & MCP]`

> Why 8 hours, not 6: setup and first working tool is 1 hour. The transport comparison and MCP Inspector debugging typically takes 2–3 hours for a first-time builder. The unit test harness is another 2 hours. Budget honestly.

Build an MCP server using FastMCP that exposes exactly three tools:

**Tool 1 — Read tool (resource-style):** Fetches structured data from a source you define. No side effects. Returns clean JSON. Example: reads from a SQLite database, a local CSV, or a public API.

**Tool 2 — Write/transform tool:** Performs an action with a side effect. Returns a result that confirms the action succeeded. Example: appends to a file, updates a database record, or transforms and saves a document.

**Tool 3 — External API tool:** Calls a real third-party API. Must handle the case where the API is down or returns an unexpected response — log the error and return a structured error object rather than raising an unhandled exception.

Requirements for all three tools:

- Write every docstring as if Claude is reading it to decide whether to call the tool — because it is. FastMCP auto-generates JSON Schema from your Python type hints and docstrings. A vague docstring means Claude calls the wrong tool.
- Test each tool with the MCP Inspector before connecting any client: `npx @modelcontextprotocol/inspector`
- Connect via stdio locally, then configure the same server for Streamable HTTP from a second terminal. Document the configuration difference and what changes in Claude's behaviour.
- Write a unit test that mocks the MCP client layer and verifies each tool returns a correctly structured JSON-RPC response for both success and error cases.

**Tools:** Python · FastMCP · `mcp` SDK · MCP Inspector · Claude Desktop or Claude Code

---

### 2.3 Claude Code — The Developer Workflow Layer · ~12 hours

> Install Claude Code before starting this section. Hands-on is non-negotiable. Exam questions about Claude Code configuration cannot be answered correctly from reading alone — the questions describe behaviour and ask you to identify the correct configuration. You need to have seen the behaviour yourself.

---

**Claude Code 101** · Anthropic Academy · ~1h · 🆓  
`[Claude Code]`

The Explore → Plan → Code → Commit workflow. Start here if you have never used an agentic coding tool. 30 minutes of video, 30 minutes of doing it on a real project.

→ https://anthropic.skilljar.com

---

**Claude Code in Action** · Anthropic Academy · 6h (videos) + 3h (exercises) = ~9h · 🆓  
`[Claude Code]` `[Context Management]` `[Tool Design & MCP]`

Primary preparation for the Claude Code domain. Complete every lesson — do not skip hooks, the GitHub integration module, or the SDK section. Those are the exact areas the exam tests. The hooks module in particular: understand the difference between pre-execution and post-execution hooks, what data each receives, and what each can and cannot do.

Requires a Pro/Max/Enterprise plan or API key for hands-on exercises.

→ https://anthropic.skilljar.com

---

**Claude Code Official Docs** · code.claude.com · ~1.5h reading · 🆓  
`[Claude Code]`

The ground truth for: CLAUDE.md hierarchy (global → project → local, what each scope can override), hook event types and configuration format, custom slash command syntax, permission tiers, and GitHub Actions integration. Read the configuration formats exactly — the exam uses precise Anthropic terminology and questions are written from these docs.

→ https://code.claude.com/docs

---

**Claude Code Ultimate Guide** · FlorianBruniaux · GitHub · ~1.5h study · 🆓  
`[Claude Code]` `[Agentic Architecture]`

41 diagrams covering the 4-layer context model, multi-agent topologies, security model, and the "which mechanism for what?" configuration decision map across all 7 configuration layers. Prioritise: the CLAUDE.md hierarchy diagram, the hooks event model diagram, and the table comparing hooks vs skills vs commands vs custom instructions. Scenario questions on this distinction are confirmed exam material.

→ https://github.com/FlorianBruniaux/claude-code-ultimate-guide

---

#### Hands-On Projects

**Project A — Instrumented CLAUDE.md + Hook System · ~3h**  
`[Claude Code]`

On a real project (any active codebase), configure:

- A `CLAUDE.md` at the project root defining: codebase context, at least two tool restrictions (one allowed, one disallowed), and one custom slash command
- A pre-execution hook that logs every tool call to a timestamped file: tool name, arguments, and timestamp
- A post-execution hook that appends a one-line session summary to a separate log file

Run Claude Code through a real task. Read both log files in full. Then break the configuration deliberately in three ways and fix each:

1. Create a conflicting tool restriction at the global scope and project scope — observe which scope wins
2. Write a malformed hook script that exits with a non-zero code — observe how Claude Code handles it
3. Remove the CLAUDE.md entirely mid-session — observe the behaviour change

**Tools:** Claude Code · Any real codebase · Shell scripting for hooks

---

**Project B — CI/CD Integration with GitHub Actions · ~4h**  
`[Claude Code]`

Set up Claude Code in a GitHub Actions workflow:

- Trigger on pull request creation
- Claude Code reviews the diff and posts a structured comment: bugs found, test coverage gaps, and one recommended change
- The comment must be machine-parseable (JSON structure in a code block) so a downstream step could act on it

Deliberately break the integration twice and fix each:

1. Use a malformed API key — observe the exact error and where it surfaces
2. Send a diff large enough to overflow the context window — observe the degradation and implement a solution (chunking, summarising, or scoping the diff)

**Tools:** Claude Code · GitHub Actions · Any test repository

---

### 2.4 Computer Use — The Agentic Extension · ~2 hours

> Why this is here: computer use appears in agentic architecture exam questions and is consistently omitted from study plans. You do not need to build a production computer use system — you need to understand the architecture, the permission model, and where it fits in agentic design decisions.

---

**Computer Use Quickstart** · Anthropic GitHub · ~1.5h study · 🆓  
`[Agentic Architecture]`

Study the computer use quickstart implementation: how the tool is invoked, what permissions it requires, how Claude coordinates mouse/keyboard actions with reasoning, and the security implications of giving Claude desktop control. Read the README fully and skim the source code for the tool call structure.

→ https://github.com/anthropics/claude-quickstarts

---

**Computer Use Docs** · Anthropic Docs · ~30 min · 🆓  
`[Agentic Architecture]`

The official guidance on when computer use is the right architectural choice vs MCP tools or API tool use. This comparison is exam-relevant — questions will describe a scenario and ask which approach is most appropriate.

→ https://docs.claude.com/en/docs/build-with-claude/computer-use

---

### 2.5 Phase 2 Consolidation · ~2 hours

Answer the following from memory before starting Phase 3. If you cannot answer any of them, identify the relevant resource above and re-read it.

- A Claude API call returns JSON that is syntactically valid but fails your Pydantic schema on one field. Describe the exact retry strategy that minimises token cost while maximising the probability of a valid response on the second attempt.
- Your MCP server exposes 25 tools. A colleague says this will hurt Claude's tool selection accuracy. Why? What is the recommended maximum and what architectural change should you make?
- Describe the difference between stdio and Streamable HTTP MCP transport. When would you choose one over the other in a production system?
- In a CLAUDE.md hierarchy, if the global config disallows a tool and the project config allows it, which wins? What about the reverse?
- What is a pre-execution hook and what can it not do that a post-execution hook can?
- In what scenario would you use computer use over MCP tools for the same task? What does the answer depend on?

---

## Phase 3 — Advanced  · ~22 hours

> **Goal:** Agentic systems design. Multi-agent orchestration, subagent delegation, fallback loop architecture, multi-instance review, and context stress testing. This phase cannot be rushed. The 27% agentic domain requires the API, MCP, Claude Code, and context foundations to be solid — candidates who jump here too early lose marks on questions that assume intermediate understanding.

---

### 3.1 Agentic Architecture — The Systems Design Layer · ~14 hours

---

**Introduction to Subagents** · Anthropic Academy · ~1h · 🆓  
`[Agentic Architecture]`

Isolated sub-agents, context delegation, and keeping the main orchestrator session clean. The most direct map to the highest-weighted domain. Take it before the SDK demos so you have the vocabulary before you encounter the code.

→ https://anthropic.skilljar.com

---

**Agent Skills Course** · Anthropic Academy · ~2h · 🆓  
`[Agentic Architecture]` `[Claude Code]`

SKILL.md frontmatter, trigger descriptions, tool access restrictions, team sharing, and enterprise deployment patterns. Covers how individual skills compose into larger orchestration — exam questions ask about which mechanism (skill vs hook vs command vs subagent) to use for a given requirement.

→ https://anthropic.skilljar.com

---

**claude-agent-sdk-demos** · Anthropic GitHub · ~2h study · 🆓  
`[Agentic Architecture]`

Official Anthropic multi-agent demos. Prioritise in this order:

1. Multi-agent research system: coordinated subagents, specialist delegation, result synthesis
2. V2 Session API: multi-turn conversation with session persistence across calls
3. Branding assistant with AskUserQuestion: surfacing human-in-the-loop checkpoints within an agentic loop

Study the multi-agent research demo at source-code level. Understand how the orchestrator decides which subagent to call, how it handles a subagent that returns nothing, and how the result synthesis step is structured. These are the exact patterns the exam scenario questions are built around.

→ https://github.com/anthropics/claude-agent-sdk-demos

---

**Agentic AI from Claude Code** · ahmedk20 · GitHub · ~2h study · 🆓  
`[Agentic Architecture]` `[Claude Code]`

Structured learning path through Claude Code's production architecture: tool definitions, the QueryEngine orchestration engine, subagent delegation, task system design, and MCP integration. Studying real production code gives you the systems intuition the exam is designed to test — not a toy example intuition.

→ https://github.com/ahmedk20/agentic-ai-from-claude-code

---

**Dive into Claude Code** · VILA-Lab · GitHub · ~1h study · 🆓  
`[Agentic Architecture]`

Systematic academic analysis of Claude Code's multi-agent architecture: the orchestrator/subagent split, tool-calling loops, coordinator patterns, and the cross-cutting integrative mechanisms that are the real locus of engineering complexity. Read the multi-agent and coordinator sections. This is the theoretical complement to the hands-on SDK demos.

→ https://github.com/VILA-Lab/Dive-into-Claude-Code

---

#### Hands-On Projects

**Project A — Multi-Agent Research Pipeline · ~5h**  
`[Agentic Architecture]`

> Why 5 hours, not 4: the first working version with a single subagent takes about 90 minutes. The fallback loop, confidence routing, and independent review instance each add 45–60 minutes of work and debugging. Budget honestly.

Build a two-agent system using the Claude Agent SDK:

- **Orchestrator agent:** receives a research brief, decomposes it into 3–5 focused sub-tasks, delegates each to a subagent, collects results, synthesises a final report
- **Subagent workers:** each handles exactly one sub-task and returns a typed Pydantic result

Extensions that map directly to confirmed exam topics — all required:

- **Fallback loop:** if a subagent returns an empty or schema-invalid result, the orchestrator retries with a rephrased sub-task prompt. Maximum 2 retries per sub-task. After 2 failures, the orchestrator logs the gap and synthesises the report with a noted gap rather than blocking.
- **Confidence scoring:** each subagent appends a confidence score (1–5) to its result. The orchestrator routes any result scored 1–2 to an independent review instance before including it in the synthesis.
- **Independent review instance:** must be initialised fresh — with no access to the original subagent's chain-of-thought or reasoning context. A review instance that can see the original reasoning is not independent and will replicate the original errors. This is the multi-instance pattern the exam specifically tests.

Use `anthropics/claude-agent-sdk-demos` multi-agent research demo as your scaffold.

**Tools:** Python · Claude Agent SDK · `anthropic` SDK · Pydantic

---

**Project B — SKILL.md Agentic Workflow · ~4h**  
`[Agentic Architecture]` `[Claude Code]`

Write a SKILL.md that targets a real repeatable task in your work. It must:

- Have a precise trigger description — vague descriptions cause misfires
- Specify which tools are explicitly allowed and which are explicitly disallowed (with a reason for each restriction)
- Delegate one focused sub-task to a subagent
- Define graceful degradation: if the subagent fails, the skill continues with a noted gap rather than raising an error

Commit to a real repo. Test in Claude Code. Then deliberately break it in three ways and document each:

1. Make the trigger description ambiguous — observe how activation changes
2. Add a tool restriction that conflicts with what the subagent needs — observe the error
3. Give the subagent an underspecified instruction — observe the quality degradation

The exam tests failure modes, not just happy paths. You need to have seen failures to answer failure-mode questions correctly.

**Tools:** Claude Code · SKILL.md · Any real codebase

---

### 3.2 Context Management — Advanced Applications · ~5 hours

> This section builds on Phase 1.4. You already understand the constraints. This section is about designing systems that work within them gracefully rather than failing when they are exceeded.

---

#### Hands-On Project — Context Stress Test + Multi-Pass Review System · ~5h

`[Context Management]` `[Agentic Architecture]`

**Part 1 — Context overflow characterisation (~2h):**

Build a Python script that incrementally adds content to a prompt in 1,000-token steps until you hit the model's context limit. At each step, run the same evaluation task and log: token count, output quality (score 1–5), latency, and any truncation or degradation.

Identify the token count at which output quality meaningfully degrades — this is your practical context limit for that task type, which will be lower than the model's theoretical maximum.

Redesign the same task using prompt caching across multiple API calls. Log the cost difference.

**Part 2 — Two-instance review system (~3h):**

- Instance A generates an output (a code review or written analysis)
- Instance B is initialised fresh — no access to Instance A's reasoning — and reviews the same output independently
- Instance A self-reviews the same output in the same session it generated it
- Run this comparison across 5 different outputs
- Score each review: issues found, issues missed, issues invented (hallucinated)
- Document the results

The multi-instance review pattern will be measurably more effective in your comparison. Candidates who have run this experiment answer the multi-instance review questions differently — and more correctly — than candidates who only read about it.

**Tools:** Python · Claude API · `anthropic` SDK · Python `logging`

---

### 3.3 Phase 3 Consolidation · ~2 hours

Answer these before booking the exam. These require synthesis across multiple domains.

- Your multi-agent pipeline has an orchestrator calling three subagents in sequence. Subagent 2 returns an empty result. Describe the complete fallback architecture: what the orchestrator should do, what signals it should log, and under what condition it should abandon the task vs degrade gracefully.
- You have a 200,000-token document you need Claude to review in detail. Name three architecturally distinct approaches, describe the context and cost tradeoffs of each, and state when each is the right choice.
- A colleague proposes using a single Claude instance to both generate and review a critical output. Explain why this is architecturally flawed and describe the correct implementation.
- Your SKILL.md has a trigger description of "when working with data". In production it fires on unrelated tasks. What is the root cause and how do you fix it?
- In a multi-agent system, one agent calls an external API and another reviews the result for accuracy. Which agent should be the orchestrator? Where should the MCP server live? Justify both answers.

---

## Final Preparation — Practice Questions & Exam Drill · ~8 hours

> Use these after completing all three phases. Practice questions used too early reinforce guessing rather than understanding. Used after the projects, they are diagnostic — they tell you which domain to re-read, not which answer to memorise.

---

**claudecertifications.com**  study plan + practice questions + anti-patterns guide · 🆓  
`[All Domains]`

Free structured study plan, domain breakdowns, anti-patterns guide, and scenario walkthroughs. Use the anti-patterns guide specifically — it lists the exact wrong approaches the exam uses as distractors. No signup required.

Allocate 3 hours here. Read the rationale for every wrong answer, not just the ones you got wrong.

→ https://claudecertifications.com/claude-certified-architect

---

**CertSafari** · 609 exam-style practice questions with rationales  
`[All Domains]`

Filter by domain and run each domain set independently. Score yourself per domain. Any domain below 80% means going back to the relevant Phase 2 or Phase 3 section before booking.

Allocate 5 hours here. At a realistic pace of reading questions and rationales properly, 5 hours covers approximately 150–200 questions in depth — which is more valuable than skimming 400.

→ https://www.certsafari.com/anthropic/claude-certified-architect

---

## Register for the Exam

Join the Claude Partner Network (free for any organisation bringing Claude to market). The first 5,000 partner company employees receive complimentary access.

→ https://anthropic.skilljar.com/claude-certified-architect-foundations-access-request

---

## Full Resource Index

| Resource | Type | Domain(s) | Hours | Cost |
|---|---|---|---|---|
| AI Capabilities & Limitations | Course | Prompt Eng, Context Mgmt | 1h | 🆓 |
| AI Fluency Foundations | Course | Prompt Engineering | 4h | 🆓 |
| Claude 101 | Course | Prompt Eng, Context Mgmt | 3h | 🆓 |
| Models Overview | Docs | Prompt Eng, Context Mgmt, Agentic | 1h | 🆓 |
| API Reference — Token Pricing | Docs | Prompt Eng, Context Mgmt | 0.5h | 🆓 |
| Prompt Engineering Overview | Docs | Prompt Engineering | 2h | 🆓 |
| Context Windows & Prompt Caching | Docs | Context Management | 1.5h | 🆓 |
| Extended Thinking | Docs | Context Mgmt, Prompt Eng | 0.5h | 🆓 |
| Building with the Claude API | Course | Prompt Eng, Context Mgmt, Agentic | 12h | 🆓 |
| claude-quickstarts | GitHub | Prompt Eng, Agentic | 2h | 🆓 |
| Intro to MCP | Course | Tool Design & MCP | 2h | 🆓 |
| Build an MCP Server (official spec) | Docs | Tool Design & MCP | 1h | 🆓 |
| Claude Code MCP Docs | Docs | Tool Design & MCP, Claude Code | 1h | 🆓 |
| Build MCP Server — freeCodeCamp | Tutorial | Tool Design & MCP | 1.5h | 🆓 |
| MCP: Advanced Topics | Course | Tool Design & MCP, Agentic | 1.5h | 🆓 |
| Claude Code 101 | Course | Claude Code | 1h | 🆓 |
| Claude Code in Action | Course | Claude Code, Context Mgmt, MCP | 9h | 🆓 |
| Claude Code Official Docs | Docs | Claude Code | 1.5h | 🆓 |
| Claude Code Ultimate Guide | GitHub | Claude Code, Agentic | 1.5h | 🆓 |
| Computer Use Quickstart + Docs | GitHub/Docs | Agentic Architecture | 2h | 🆓 |
| Introduction to Subagents | Course | Agentic Architecture | 1h | 🆓 |
| Agent Skills Course | Course | Agentic, Claude Code | 2h | 🆓 |
| claude-agent-sdk-demos | GitHub | Agentic Architecture | 2h | 🆓 |
| Agentic AI from Claude Code | GitHub | Agentic, Claude Code | 2h | 🆓 |
| Dive into Claude Code | GitHub | Agentic Architecture | 1h | 🆓 |
| claudecertifications.com | Practice Qs | All Domains | 3h | 🆓 |

---

*Resources last verified May 2026. All Anthropic Academy courses are free at anthropic.skilljar.com. All GitHub repositories listed are open source. CertSafari is a paid third-party resource not affiliated with Anthropic.*

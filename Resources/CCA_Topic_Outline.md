# CCA-F Study Plan — Topic Outline
> 90 hours · 4 phases · 42 topics · 8 hands-on projects

**Domain tags:** `[Agentic]` `[Claude Code]` `[Prompt Eng.]` `[Tool & MCP]` `[Context Mgmt]`

---

## Phase 1 — Beginner · ~22h
> Build the mental model before touching any code.

### 1.1 How Claude actually works · ~4h
### 1.2 Model selection — which Claude for which task · ~2h
### 1.3 Prompt engineering — the reliability layer · ~8h
### 1.4 Context management — the constraints layer · ~4h
### 1.5 Phase 1 consolidation · ~1h

---

## Phase 2 — Intermediate  · ~38h
> Build real working systems with the Claude API, MCP, and Claude Code.

### 2.1 The Claude API — production foundation · ~12h
### 2.2 Tool design & MCP integration · ~14h
### 2.3 Claude Code — developer workflow layer · ~12h
### 2.4 Computer use — the agentic extension · ~2h
### 2.5 Phase 2 consolidation · ~2h

---

## Phase 3 — Advanced · ~22h
> Agentic systems design — the highest-weighted domain (27%) studied last, built on everything prior.

### 3.1 Agentic architecture — systems design layer · ~14h
### 3.2 Context management — advanced applications · ~5h
### 3.3 Phase 3 consolidation · ~2h

---
## Final Preparation — Practice Questions & Exam Drill · ~8h
> Use only after completing all three phases. These are diagnostic, not a shortcut.

### 4.1 claudecertifications.com · 3h

### 4.2 CertSafari — 609 questions filtered by domain · 5h


---







---

## Phase 1 — Beginner · ~22h
> Build the mental model before touching any code.

### 1.1 How Claude actually works · ~4h

- [ ] 1.1.1 AI Capabilities & Limitations — hallucination mechanics, attention behaviour, failure modes `[Prompt Eng.]` `[Context Mgmt]`
- [ ] 1.1.2 AI Fluency Foundations — the 4D Framework: Delegation, Description, Discernment, Diligence `[Prompt Eng.]`
- [ ] 1.1.3 Claude 101 — usage patterns, projects, artifacts, connectors, research mode `[Prompt Eng.]` `[Context Mgmt]`

### 1.2 Model selection — which Claude for which task · ~2h

- [ ] 1.2.1 Models overview — capability, context window sizes, cost per token, recommended use cases `[Agentic]` `[Context Mgmt]`
- [ ] 1.2.2 API reference — input vs output token pricing, Batch API cost model `[Prompt Eng.]` `[Context Mgmt]`

### 1.3 Prompt engineering — the reliability layer · ~8h

- [ ] 1.3.1 Prompt engineering overview (all sub-pages) — official Anthropic docs `[Prompt Eng.]`
- [ ] 1.3.2 Chain-of-thought prompting `[Prompt Eng.]`
- [ ] 1.3.3 Few-shot examples — positive and negative `[Prompt Eng.]`
- [ ] 1.3.4 XML structuring and tag-based formatting `[Prompt Eng.]`
- [ ] 1.3.5 System prompt vs user prompt — how Claude weights each `[Prompt Eng.]`
- [ ] 1.3.6 **Project — prompt reliability experiment** (10 structures × 5 runs, document findings) `[Prompt Eng.]`

### 1.4 Context management — the constraints layer · ~4h

- [ ] 1.4.1 Context windows — limits per model, practical vs theoretical ceiling `[Context Mgmt]`
- [ ] 1.4.2 Prompt caching — eligibility rules, minimum token threshold, 5-minute cache lifetime `[Context Mgmt]`
- [ ] 1.4.3 Extended thinking — when it helps, token cost, interaction with structured output `[Context Mgmt]` `[Prompt Eng.]`

### 1.5 Phase 1 consolidation · ~1h

- [ ] 1.5.1 Answer 6 gating questions from memory before moving to Phase 2

---

## Phase 2 — Intermediate  · ~38h
> Build real working systems with the Claude API, MCP, and Claude Code.

### 2.1 The Claude API — production foundation · ~12h

- [ ] 2.1.1 Building with the Claude API course (full) `[Prompt Eng.]` `[Context Mgmt]` `[Agentic]`
- [ ] 2.1.2 Streaming — how it works, when to use it `[Prompt Eng.]`
- [ ] 2.1.3 Tool use — defining tools, tool choice, parallel tool calls `[Tool & MCP]`
- [ ] 2.1.4 Structured output — enforcing schemas, JSON mode, validation `[Prompt Eng.]`
- [ ] 2.1.5 Batch API — cost optimisation, batching vs streaming tradeoffs `[Prompt Eng.]`
- [ ] 2.1.6 claude-quickstarts — customer support agent & financial analyst (read source code) `[Prompt Eng.]` `[Agentic]`
- [ ] 2.1.7 **Project — structured output pipeline with validation loop + Batch API comparison** `[Prompt Eng.]` `[Context Mgmt]`

### 2.2 Tool design & MCP integration · ~14h

- [ ] 2.2.1 Introduction to MCP — three primitives: tools, resources, prompts `[Tool & MCP]`
- [ ] 2.2.2 Build an MCP server — official weather server tutorial (modelcontextprotocol.io) `[Tool & MCP]`
- [ ] 2.2.3 stdio vs Streamable HTTP transport — differences and when to use each `[Tool & MCP]`
- [ ] 2.2.4 Claude Code MCP docs — project-scoped servers, .mcp.json format, tool search (lazy loading) `[Tool & MCP]` `[Claude Code]`
- [ ] 2.2.5 MCP security — tool poisoning, prompt injection via tool results (freeCodeCamp guide) `[Tool & MCP]`
- [ ] 2.2.6 MCP: Advanced Topics — sampling, notifications, file system access `[Tool & MCP]` `[Agentic]`
- [ ] 2.2.7 Tool description quality — docstrings as JSON schema source, FastMCP type hint generation `[Tool & MCP]`
- [ ] 2.2.8 **Project — production MCP server with 3 tools + MCP Inspector testing + unit tests** `[Tool & MCP]`

### 2.3 Claude Code — developer workflow layer · ~12h

- [ ] 2.3.1 Claude Code 101 — Explore → Plan → Code → Commit workflow `[Claude Code]`
- [ ] 2.3.2 Claude Code in Action (full course) — hooks, GitHub integration, SDK `[Claude Code]` `[Context Mgmt]` `[Tool & MCP]`
- [ ] 2.3.3 CLAUDE.md hierarchy — global → project → local, scope precedence rules `[Claude Code]`
- [ ] 2.3.4 Hooks — pre-execution vs post-execution, event data, what each can and cannot do `[Claude Code]`
- [ ] 2.3.5 Custom slash commands — syntax, scope, use cases `[Claude Code]`
- [ ] 2.3.6 Permission tiers — what each level allows and restricts `[Claude Code]`
- [ ] 2.3.7 Claude Code ultimate guide — hooks vs skills vs commands decision map (FlorianBruniaux) `[Claude Code]` `[Agentic]`
- [ ] 2.3.8 **Project A — instrumented CLAUDE.md + pre/post hook system on a real codebase** `[Claude Code]`
- [ ] 2.3.9 **Project B — CI/CD integration with GitHub Actions: diff review + structured PR comment** `[Claude Code]`

### 2.4 Computer use — the agentic extension · ~2h

- [ ] 2.4.1 Computer use quickstart — tool invocation, permissions, security model `[Agentic]`
- [ ] 2.4.2 Computer use vs MCP tools vs API tool use — when to choose each `[Agentic]` `[Tool & MCP]`

### 2.5 Phase 2 consolidation · ~2h

- [ ] 2.5.1 Answer 6 gating questions from memory before moving to Phase 3

---

## Phase 3 — Advanced · ~22h
> Agentic systems design — the highest-weighted domain (27%) studied last, built on everything prior.

### 3.1 Agentic architecture — systems design layer · ~14h

- [ ] 3.1.1 Introduction to subagents — isolation, context delegation, session management `[Agentic]`
- [ ] 3.1.2 Agent Skills course — SKILL.md frontmatter, trigger descriptions, tool access restrictions `[Agentic]` `[Claude Code]`
- [ ] 3.1.3 Orchestrator vs subagent responsibilities — boundary rules and responsibility split `[Agentic]`
- [ ] 3.1.4 Fallback loop design — retry strategy, maximum retries, graceful degradation vs hard failure `[Agentic]`
- [ ] 3.1.5 Multi-instance review — why independent instances outperform self-review, self-review bias `[Agentic]` `[Context Mgmt]`
- [ ] 3.1.6 claude-agent-sdk-demos — multi-agent research system (read source code) `[Agentic]`
- [ ] 3.1.7 V2 Session API — multi-turn conversation with session persistence across calls `[Agentic]`
- [ ] 3.1.8 Human-in-the-loop checkpoints — AskUserQuestion pattern within an agentic loop `[Agentic]`
- [ ] 3.1.9 Agentic AI from Claude Code — QueryEngine, tool-calling loops, coordinator patterns `[Agentic]` `[Claude Code]`
- [ ] 3.1.10 Dive into Claude Code — multi-agent topology analysis, cross-cutting integrative mechanisms `[Agentic]`
- [ ] 3.1.11 **Project A — multi-agent research pipeline: fallback loops + confidence routing + independent review instance** `[Agentic]`
- [ ] 3.1.12 **Project B — SKILL.md agentic workflow: trigger precision, subagent delegation, deliberate failure mode testing** `[Agentic]` `[Claude Code]`

### 3.2 Context management — advanced applications · ~5h

- [ ] 3.2.1 Context overflow characterisation — practical vs theoretical limits, per-task degradation point `[Context Mgmt]`
- [ ] 3.2.2 Attention dilution — how output quality degrades as token fill level rises `[Context Mgmt]`
- [ ] 3.2.3 Multi-pass review — splitting large tasks into focused local passes and integration passes `[Context Mgmt]` `[Agentic]`
- [ ] 3.2.4 **Project — context stress test + two-instance review vs self-review scored comparison** `[Context Mgmt]` `[Agentic]`

### 3.3 Phase 3 consolidation · ~2h

- [ ] 3.3.1 Answer 5 cross-domain synthesis questions from memory before booking the exam

---

## Final Preparation — Practice Questions & Exam Drill · ~8h
> Use only after completing all three phases. These are diagnostic, not a shortcut.

### 4.1 claudecertifications.com · 3h

- [ ] 4.1.1 Anti-patterns guide — exact wrong approaches the exam uses as distractors `[All Domains]`
- [ ] 4.1.2 Practice questions — read rationale for every wrong answer, not just your own mistakes `[All Domains]`
- [ ] 4.1.3 Scenario walkthroughs — domain breakdown and study plan `[All Domains]`

### 4.2 CertSafari — 609 questions filtered by domain · 5h

- [ ] 4.2.1 Run each domain set independently and score yourself per domain `[All Domains]`
- [ ] 4.2.2 Any domain below 80% → return to the relevant Phase 2 or Phase 3 section before booking `[All Domains]`

---

## Summary

| Phase | Focus | Hours |
|---|---|---|
| Phase 1 — Beginner | Foundations, prompt engineering, context constraints | 22h |
| Phase 2 — Intermediate | Claude API, MCP, Claude Code, computer use | 38h |
| Phase 3 — Advanced | Agentic architecture, multi-agent systems, context stress testing | 22h |
| Final prep | Practice questions, exam drill | 8h |
| **Total** | | **90h** |

| Domain | Exam weight | Sections |
|---|---|---|
| Agentic Architecture & Orchestration | 27% | 1.2, 2.4, 3.1, 3.2 |
| Claude Code Configuration & Workflows | 20% | 2.3 |
| Prompt Engineering & Structured Output | 20% | 1.3, 2.1 |
| Tool Design & MCP Integration | 18% | 2.2 |
| Context Management & Reliability | 15% | 1.4, 3.2 |

---

*Register for the exam via the Claude Partner Network (free for any organisation):*  
https://anthropic.skilljar.com/claude-certified-architect-foundations-access-request

# Domain 2 — Tool Design & MCP Integration

**Exam Weight: 18%**

This domain tests your ability to design well-scoped tools, build and configure MCP (Model Context Protocol) servers, and integrate external services into Claude-powered applications. MCP is becoming the standard interface for connecting Claude to the outside world — think of it as USB-C for AI.

---

## Topics to Cover

### 2.1 Tool Design Fundamentals
- Anatomy of a tool definition: `name`, `description`, `input_schema`
- Writing tool descriptions that guide Claude's reasoning effectively
- Schema design: required vs. optional fields, type constraints, enums
- The principle of minimal footprint: tools should do one thing well
- How too many tools or overlapping tool descriptions cause reasoning overload

### 2.2 Tool Error Handling
- Returning structured error responses vs. raising exceptions
- How Claude interprets tool errors and whether it retries
- Designing error messages that help Claude self-correct
- Distinguishing recoverable errors (retry) from terminal errors (escalate)

### 2.3 MCP Architecture
- The three core MCP primitives: **tools** (executable functions), **resources** (data), **prompts** (templates)
- MCP server vs. MCP client — who is responsible for what
- Transport mechanisms: `stdio` (local) vs. `SSE` (remote/network)
- MCP server lifecycle: initialisation, capability negotiation, request handling

### 2.4 Building MCP Servers
- Building an MCP server in Python using the `mcp` SDK
- Building an MCP server in TypeScript/Node.js
- Registering tools, resources, and prompts on a server
- Tool boundary design: where does the tool end and the agent begin?

### 2.5 MCP Configuration
- `.claude/settings.json` — configuring MCP servers for a project
- User-level vs. project-level MCP config scoping
- Connecting Claude Code to a local MCP server via `stdio`
- Connecting to a remote MCP server via `SSE`

### 2.6 Claude's Built-In Tools
- `web_search`, `code_execution`, `file_operations` — when each is available
- How built-in tools interact with custom tools in the same session
- Disabling built-in tools when they conflict with custom implementations

### 2.7 Security & Tool Boundaries
- Principle of least privilege: restrict `allowed-tools` in subagents
- Preventing a tool from performing unintended side effects
- Input validation inside tool implementations
- Why you should never trust Claude's tool inputs without validation

---

## Hands-On Projects

### 🔌 Project 1 — NHS Data MCP Server

Build a local MCP server that exposes NHS-style data as structured tools and resources:

- **Tool:** `get_patient_summary(patient_id)` — returns a mock patient record
- **Tool:** `search_referrals(specialty, date_range)` — queries a mock referrals dataset
- **Resource:** `nhs_icd_codes` — exposes a lookup table of ICD-10 codes as a readable resource
- **Prompt:** `generate_discharge_summary` — a reusable prompt template for discharge summaries

Connect your server to Claude Code via `stdio` transport and verify Claude can call each tool from the terminal.

**What you'll learn:** MCP primitives in practice, stdio transport, tool schema design, resource exposure

**Stretch goal:** Extend the server with a `create_referral` tool that writes to a local SQLite database, then add input validation that rejects invalid specialty codes.

---

### 🌐 Project 2 — Remote MCP Service with SSE Transport

Build a FastAPI-based MCP server that runs as a web service (deployable to any cloud):

- Expose at least 3 tools over **SSE transport**
- Implement **authentication** — the server should reject requests without a valid API key header
- Add a `/health` endpoint the devcontainer can use to verify the server is running
- Connect Claude Code to the remote server via its SSE URL in `.claude/settings.json`
- Write a test script that calls each tool through Claude and validates the responses

**What you'll learn:** SSE transport, remote MCP servers, auth patterns, production deployment considerations

**Stretch goal:** Add rate limiting to the server so Claude can't accidentally hammer it during an agentic loop, and handle the `429` response gracefully in your tool error handler.

---

## Folder Structure (for contributors)

```
domain-2-tool-design-mcp/
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

- Writing vague tool descriptions like "does stuff with data" — Claude relies on these to decide when to call the tool
- Defining 15 tools when 4 well-scoped ones would do — causes reasoning overload
- Raising unhandled exceptions instead of returning structured error objects
- Using user-level MCP config for a project-specific server (wrong scope)
- Forgetting to validate tool inputs server-side — never trust the model

# Claude Certified Architect — Exam Prep Repository

A structured, collaborative learning environment for the **Claude Certified Architect (CCA) Foundations** exam. Each of the five exam domains has its own folder, with two independent course versions created by different contributors — giving learners multiple perspectives on every topic.

---

## How This Repo Is Organised

```
cca-exam-prep/
├── .devcontainer/              # GitHub Codespaces environment config
├── domain-1-agentic-architecture/
│   ├── version-a/              # Course by Contributor A
│   ├── version-b/              # Course by Contributor B
│   └── README.md               # Domain overview + hands-on projects
├── domain-2-tool-design-mcp/
├── domain-3-claude-code-configuration/
├── domain-4-prompt-engineering/
└── domain-5-context-management/
```

---

## The Five Exam Domains

| # | Domain | Exam Weight |
|---|--------|-------------|
| 1 | Agentic Architecture & Orchestration | 27% |
| 2 | Tool Design & MCP Integration | 18% |
| 3 | Claude Code Configuration & Workflows | 20% |
| 4 | Prompt Engineering & Structured Output | 20% |
| 5 | Context Management & Reliability | 15% |

---

## Getting Started in GitHub Codespaces

1. Fork or clone this repository to your GitHub account
2. Click **Code → Codespaces → Create codespace on main**
3. Wait for the environment to build (~2 minutes on first run)
4. Add your `ANTHROPIC_API_KEY` as a Codespaces secret at:
   `https://github.com/settings/codespaces`
5. Open a terminal and run `claude` to verify everything works

---

## For Course Contributors

Each domain folder contains a `README.md` with:
- The full list of topics to cover
- Two hands-on projects learners must build
- Suggested structure for your `version-a` or `version-b` folder

**Guidelines:**
- Your version folder is yours to structure as you see fit — lessons, notebooks, scripts, exercises
- Aim for a learner who is mixed-level but motivated to pass the exam brilliantly
- Every concept should have a working code example
- Include a `SOLUTIONS.md` or `solutions/` folder so learners can check their work

---

## Exam Fast Facts

- **Format:** 60 scenario-based multiple choice questions
- **Duration:** 120 minutes (proctored)
- **Passing score:** 720 / 1000
- **Cost:** $99 per attempt (free for first 5,000 Claude Partner Network members)
- **Access:** Via the [Claude Partner Network](https://www.anthropic.com/news/claude-partner-network)
- **Prep platform:** [Anthropic Academy on Skilljar](https://anthropic.skilljar.com)

---

## Recommended Study Order

1. Domain 1 — highest exam weight, foundational for everything else
2. Domain 3 — most practical, builds real Claude Code muscle memory
3. Domain 2 — MCP is tested deeply and cross-cuts other domains
4. Domain 4 — prompt engineering underpins every other domain
5. Domain 5 — context management ties it all together

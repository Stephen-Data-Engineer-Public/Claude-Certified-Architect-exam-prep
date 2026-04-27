# CCA Exam Prep — Claude Code Project Context

## What This Project Is

A collaborative course repository for the Claude Certified Architect (CCA) Foundations exam. Five domains, two independent course versions per domain. Target audience: mixed levels, goal is exam excellence.

## Project Structure

- Each `domain-N-*/` folder contains a `README.md` (topics + projects) and two contributor folders (`version-a/`, `version-b/`)
- `.devcontainer/` configures the GitHub Codespaces environment
- Contributors work inside their assigned `version-a` or `version-b` folder only

## Conventions

- All code examples must be runnable — no pseudocode in solutions
- Python files use snake_case, TypeScript files use camelCase
- Every exercise must have a corresponding solution in `solutions/`
- Never commit API keys — use environment variables only (`ANTHROPIC_API_KEY`)
- Markdown files use sentence case for headings (not Title Case for every word)

## Tech Stack

- Python 3.12 (primary language for examples)
- Node.js 22 / TypeScript (for MCP server examples)
- Claude Code CLI (`claude`)
- Anthropic Python SDK (`anthropic`)
- FastAPI for any web service examples
- pytest for Python tests

## Never Do This

- Hard-code API keys anywhere in the codebase
- Skip error handling in agentic loop examples — reliability is a core exam topic
- Write lessons without working code — every concept needs a runnable example

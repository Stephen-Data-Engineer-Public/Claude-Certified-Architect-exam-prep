#!/bin/bash
set -e

echo "========================================="
echo " CCA Exam Prep — Environment Setup"
echo "========================================="

# Install Claude Code CLI
echo ">> Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

# Install Python dependencies
echo ">> Installing Python packages..."
pip install --upgrade pip
pip install anthropic httpx fastapi uvicorn pydantic python-dotenv pytest pytest-asyncio rich typer

# Install Node.js global tools
echo ">> Installing Node.js tools..."
npm install -g tsx typescript ts-node

# Verify Claude Code is installed
echo ">> Verifying Claude Code..."
claude --version

# Verify API key is set
if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo ""
  echo "⚠️  WARNING: ANTHROPIC_API_KEY is not set."
  echo "   Add it as a Codespaces secret at:"
  echo "   https://github.com/settings/codespaces"
  echo ""
else
  echo "✅ ANTHROPIC_API_KEY is set."
fi

echo ""
echo "========================================="
echo " Environment ready! Run: claude"
echo "========================================="

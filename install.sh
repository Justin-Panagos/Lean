#!/bin/bash
# Lean Skills - Install Script
# Usage: curl -fsSL https://raw.githubusercontent.com/<your-repo>/main/install.sh | bash

set -e

REPO="https://raw.githubusercontent.com/<your-username>/lean/main"
SKILLS_DIR=".claude/skills"
HOOKS_DIR=".claude/hooks"

echo ""
echo "  🔧 Lean Skills Installer"
echo "  Lean, token-efficient workflow for Claude Code"
echo ""

# Check Claude Code is available
if ! command -v claude &> /dev/null; then
  echo "  ⚠️  Claude Code not found. Install it first."
  echo "  https://docs.anthropic.com/en/docs/claude-code"
  exit 1
fi

# Create directories
mkdir -p "$SKILLS_DIR"
mkdir -p "$HOOKS_DIR"

# Detect developer or vibecoder
echo "  Are you a developer comfortable managing Git yourself? (y/n)"
read -r git_answer

SKILLS=(
  ln-setup
  ln-fl-session-start
  ln-config
  ln-map-codebase
  ln-codebase-explorer
  ln-brainstorm
  ln-plan
  ln-implement
  ln-code-review
  ln-debug
  ln-spike
  ln-handoff
  ln-health
  ln-free-to-structured
  ln-create-skill
  ln-tdd
)

if [[ "$git_answer" =~ ^[Nn] ]]; then
  SKILLS+=("ln-save-work")
  echo "  → Vibecoder mode: ln-save-work included"
else
  echo "  → Developer mode: Git is yours to manage"
fi

# Download skills
echo ""
echo "  Downloading skills..."
for skill in "${SKILLS[@]}"; do
  curl -fsSL "$REPO/skills/${skill}.md" -o "$SKILLS_DIR/${skill}.md"
  echo "  ✓ $skill"
done

# Download hooks
echo ""
echo "  Downloading hooks..."
for hook in session-start context-monitor pre-compact; do
  curl -fsSL "$REPO/hooks/${hook}.mjs" -o "$HOOKS_DIR/${hook}.mjs"
  chmod +x "$HOOKS_DIR/${hook}.mjs"
  echo "  ✓ $hook"
done

# Write settings.json
curl -fsSL "$REPO/hooks/settings.json" -o ".claude/settings.json"
echo "  ✓ hooks/settings.json"

# Done
echo ""
echo "  ✅ Lean installed. Start with /ln-setup to configure."
echo ""

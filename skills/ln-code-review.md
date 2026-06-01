---
name: ln-code-review
description: |
  Code review against project rules. Use after implementation or when reviewing
  a PR. Reviews against CLAUDE.md or equivalent spec file in the project root.

  Usage: /ln-code-review <file, PR, or feature to review>
mode: subagent
---

## Checklist

- Follows existing patterns in the codebase
- No unnecessary abstractions introduced
- No obvious performance issues (N+1, missing indexes, etc)
- Tests cover the changed behaviour
- No leftover debug code or TODOs

## Output

Flag issues as MUST FIX / SHOULD FIX / SUGGESTION. Report only - never auto-fix.


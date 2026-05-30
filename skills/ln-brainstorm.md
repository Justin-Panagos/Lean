---
name: ln-brainstorm
description: |
  Turn a rough idea into an approved design spec before any code is written.
  No code or scaffolding until design is approved - no exceptions.
  Quick tasks skip this. Medium tasks get 2 options. Hard tasks get 3 options.

  Usage: /ln-brainstorm <idea or feature>
mode: interactive
---

## Rules

- No code, no scaffolding until design is approved.
- One question at a time. Multiple choice where possible.
- YAGNI - cut unnecessary features from every design.

## Process

1. Check project state (files, docs, recent commits)
2. Ask clarifying questions one at a time - purpose, constraints, success criteria
3. Propose options with tradeoffs and recommendation:
   - Medium task: 2 options
   - Hard task: 3 options
4. Present design in sections, get approval after each
5. Write spec to `docs/specs/YYYY-MM-DD-<topic>.md`
6. Self-review spec - fix any TBDs, contradictions, ambiguity inline
7. Get user approval on written spec

## Track split (after approval)

Ask:

> "Write-up track or planning track?"

**Write-up** - capture approaches, findings, and DoD in a Notion doc via fl-notion.
**Planning** - proceed to /ln-plan.

## Spec output

- What we're building and why
- Approach chosen and why
- Success criteria (specific and testable)
- Out of scope

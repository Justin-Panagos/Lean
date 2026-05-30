---
name: ln-free-to-structured
description: |
  Convert free code work into a structured starting point. Use when you've
  been building in free code mode and want to formalise, clean up, or hand
  off what was built.

  Usage: /ln-free-to-structured <brief description of what was built>
mode: interactive
---

## Process

1. Run codebase-explorer on files touched during free code session
2. Produce a short capture doc:
   - What was built and which files changed
   - What works, what is rough
   - Any known issues or shortcuts taken
3. Ask: what next?

## What next options

**Just clean it up** - run /ln-code-review on touched files, fix MUST FIX items only.

**Formalise it** - write a spec from what was built, treat it as the approved
design, skip brainstorm. Go straight to /ln-plan for remaining work.

**It's a mess - start over** - write findings doc via fl-notion capturing what
was learned, then start fresh with /ln-brainstorm.

## Rules

- Do not retroactively enforce TDD on already-written free code.
- Do not refactor everything - only what is needed to make it maintainable.
- If the free code session produced something worth keeping, a spec must exist
  before any further structured work builds on top of it.

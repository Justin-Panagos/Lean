---
name: ln-spike
description: |
  Validate an idea through a focused experiment before committing to
  implementation. Produces verified knowledge - VALIDATED, INVALIDATED,
  or PARTIAL verdict. Use before planning when feasibility is uncertain.

  Usage: /ln-spike <idea to validate> [--quick] [--wrap-up]
mode: subagent
---

## When to use

- Unfamiliar library or API before building on it
- Uncertain whether an approach will work at scale
- Two competing technical directions - spike both cheaply
- Before a hard task classification to reduce unknowns

Skip for anything you've built before or where the approach is proven.

## Default mode

Given/When/Then framing for each experiment:
- **Given** the constraint or context
- **When** we try this approach
- **Then** we expect this outcome

Build the smallest possible thing that produces a verdict.
Output goes to `docs/ln-spikes/NNN-<topic>/` with code, results, and README.

## Verdicts

- **VALIDATED** - approach works, proceed to /ln-brainstorm or /ln-plan
- **INVALIDATED** - approach fails, document why, try alternative
- **PARTIAL** - works with caveats, document conditions, proceed carefully

## Optional: quick mode (--quick)

Skip decomposition and alignment. Jump straight to building.
Use when you already know what to spike and just need a verdict fast.

## Optional: wrap-up (--wrap-up)

Package spike findings into a persistent skill file at
`.claude/skills/ln-spike-findings-<topic>/SKILL.md` for use in future sessions.
Use when the spike produced reusable knowledge worth keeping.

## Rules

- Spike code is throwaway. Do not build on it directly.
- One spike per unknown. Do not combine multiple unknowns into one spike.
- If a spike is invalidated, write findings before moving on.

---
name: ln-implement
description: |
  Execute an approved plan as a subagent. Accepts a plan from /ln-plan or any
  spec-driven tool (GSD, Superpowers, etc). Runs tasks in order, stops and
  reports on failure.

  Usage: /ln-implement <plan file path or pasted plan>
mode: subagent
---

## Rules

- Read the full plan before writing a single line of code.
- Follow existing patterns before introducing new abstractions.
- Do not deviate from the plan - if something is wrong, stop and report.
- Do not refactor code outside current task scope.

## Subagent behaviour

- Treat each task as an isolated unit.
- Verify each task passes before moving to the next.
- On failure: report what failed, what was tried, and where to resume.

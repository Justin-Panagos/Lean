---
name: ln-plan
description: |
  Convert an approved spec into an executable implementation plan.
  Use after /ln-brainstorm produces an approved spec. Accepts a spec file path
  or pasted spec content.

  Usage: /ln-plan <spec file path or pasted spec> [--research] [--validate]
mode: interactive
---

## Rules

- Read the full spec before writing anything.
- Break work into tasks of 2-5 minutes each.
- Flag gaps or ambiguity in the spec before planning - do not assume.
- Output goes to `docs/ln-plans/YYYY-MM-DD-<topic>-plan.md`

## Task format

```
Task N: <title>
File: <exact path>
What: <what to do>
Verify: <how to confirm it worked>
```

## Optional: external research (--research)

Spawns a read-only subagent to read external docs or library references before
planning starts. Use when the plan involves unfamiliar libraries or APIs not
in the codebase.

## Optional: plan validation (--validate)

Self-checks the plan before handing to /ln-implement:
- All file paths exist
- Every task has a testable verify step
- No gaps or assumed context
- Flags issues before execution starts

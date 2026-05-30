---
name: ln-handoff
description: |
  Generate a structured context dump for resuming work in a fresh session.
  Use when ending a session mid-task, hitting context limits, or passing
  work to another agent. Auto-triggered at 60% context usage.

  Usage: /ln-handoff [--findings] [--next-session] [--overwrite]
mode: interactive
---

## Rules

- Read current session state before writing anything.
- Be specific - file paths, error messages, exact state. No vague summaries.
- Output goes to `docs/ln-handoffs/YYYY-MM-DD-HH-MM-<topic>-handoff.md`
- If a handoff for the same topic already exists, ask: overwrite or save as new version? Skip prompt if `--overwrite` passed.

## Output format

```
## Topic
<one sentence>

## What is done
<bullet list of completed tasks with file paths>

## What is not done
<bullet list of remaining tasks>

## Current state
<exact state - what works, what doesn't, any errors>

## Relevant files
<file paths that matter for resuming>

## Recommended next step
<exactly where to pick up and which skill to invoke>
```

## Optional: findings doc (--findings)

Also writes a fl-notion findings doc capturing what was learned.
Use when the session produced research, decisions, or discoveries worth keeping.

## Optional: next-session prompt (--next-session)

Generates a ready-to-paste session start prompt for the fresh context.
Includes focus, relevant files, and recommended starting skill.

## Optional: overwrite (--overwrite)

Overwrites existing handoff for the same topic without prompting.

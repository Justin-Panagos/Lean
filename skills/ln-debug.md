---
name: ln-debug
description: |
  Systematic debugging for a failing feature, test, or unexpected behaviour.
  Use after implementation when something isn't working. If the same issue
  requires more than one debug session, a findings doc must be written first.

  Usage: /ln-debug <what is broken and what was expected> [--handoff] [--research]
mode: subagent
---

## Rules

- Read the error or failure in full before touching any code.
- Form a hypothesis before making any change.
- One change at a time - verify before moving on.
- If not resolved in this session, write a findings doc via fl-notion before retrying.

## Process

1. Reproduce the issue
2. Identify the smallest failing case
3. Form hypothesis - state it explicitly
4. Test hypothesis with minimal change
5. Confirm fix or revise hypothesis

## Optional: external research (--research)

Spawns a read-only subagent to check external docs, GitHub issues, or library
changelogs before debugging starts. Use when the issue may be a known bug or
version incompatibility.

## Optional: handoff (--handoff)

Generates a structured context dump for resuming in a fresh session.
Triggers automatically if the issue is unresolved at session end.

## Output

- What the issue was
- What caused it
- What fixed it
- If unresolved: handoff doc + findings doc via fl-notion before next attempt

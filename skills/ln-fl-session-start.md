---
name: ln-fl-session-start
description: |
  Run at the start of every session to load project context and set work mode.
  Optionally pass current focus: /ln-fl-session-start <what you are working on>
mode: interactive
---

## Session Start Checklist

1. Read `.planning/codebase/ARCHITECTURE.md` and `STRUCTURE.md`
2. Confirm model is Sonnet and /effort is high. Flag if not.
3. Check /context and /cost - note starting values. Flag if above 100k.
4. Check `docs/ln-handoffs/` for existing handoffs.

## Focus detection

**If a focus was passed** - use it, skip to Mode Selection.

**If no focus was passed** - check for handoffs first:

- If handoffs exist, list them by date and topic and ask:
  > "Pick up an existing session or start fresh?"
  - User picks a handoff → load it → print summary (topic, what is done, what is not done, recommended next step) → confirm ready to continue
  - User picks fresh → ask: what is the focus for this session?

- If no handoffs exist → ask: what is the focus for this session?

## Config

Read `.planning/ln-config.json` if it exists. If not, prompt:
> "No config found. Run /ln-setup to configure, or continue with defaults (balanced profile, ask for mode each session)?"

Apply active profile to model routing for this session.

## Mode Selection

Ask once:

> "Free code or structured?"

**Free code** - no workflow, no gates, just build.

**Structured** - runs task classifier, routes to the right workflow depth.

## Task Classifier (structured mode only)

| Type | Description | Workflow |
|------|-------------|----------|
| Quick | Bug fix, single item change, config update | codebase-explorer → fix → code-review |
| Medium | New feature on existing path | codebase-explorer → brainstorm (2 options) → plan → implement → code-review |
| Hard | New system, new pathway, unknown territory | Full workflow |


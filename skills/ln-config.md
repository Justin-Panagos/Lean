---
name: ln-config
description: |
  Set or view the active profile for model routing and token behaviour.
  Profiles control which model runs for each skill mode (interactive/subagent).

  Usage: /ln-config [--profile budget|balanced|quality] [--show]
mode: interactive
---

## Profiles

| Profile | Interactive | Subagent | Use when |
|---------|-------------|----------|----------|
| budget | Haiku | Haiku | Prototyping, spikes, exploration |
| balanced | Sonnet | Haiku | Default - everyday development |
| quality | Sonnet | Sonnet | Production code, hard tasks |

Default profile: **balanced**

## Profile storage

Active profile saved to `.planning/ln-config.json`:

```json
{
  "profile": "balanced",
  "models": {
    "interactive": "sonnet",
    "subagent": "haiku"
  }
}
```

## Optional: show (--show)

Print current profile and model assignments without changing anything.

## Rules

- Subagent skills (codebase-explorer, implement, code-review, debug, map-codebase, spike) respect the subagent model
- Interactive skills (fl-session-start, brainstorm, plan, handoff, config) always use the interactive model
- Override per-session by passing model explicitly if needed
- Hard tasks should default to quality profile - flag if user is on budget during a hard task

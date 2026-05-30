---
name: ln-health
description: |
  Diagnose planning directory integrity and session context health.
  Checks for missing files, broken state, and orphaned plans.
  
  Usage: /ln-health [--repair] [--context]
mode: interactive
---

## Default (no flags)

Check `.planning/` directory integrity:

- [ ] `.planning/codebase/` exists and has all 7 documents
- [ ] `docs/ln-plans/` - no orphaned plans without a matching spec
- [ ] `docs/specs/` - no specs without a status (approved/superseded)
- [ ] `docs/ln-handoffs/` - flag handoffs older than 7 days as stale
- [ ] Skills in `.claude/skills/` - flag any with `last-used` older than 14 days

Report: PASS / WARN / FAIL per check. List actionable fixes.

## Optional: repair (--repair)

Attempt to fix issues found:
- Create missing directories
- Mark orphaned plans as archived
- Prompt before any destructive action

Never auto-delete. Always ask first.

## Optional: context check (--context)

Check current session context utilisation:

| Usage | State | Action |
|-------|-------|--------|
| Under 60% | Healthy | Continue |
| 60-70% | Warning | Wrap up current task, run /ln-handoff soon |
| 70%+ | Critical | Run /ln-handoff now - reasoning quality degrades above this |

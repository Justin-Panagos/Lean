---
name: ln-map-codebase
description: |
  Analyse existing codebase using parallel subagents and write structured
  documents to .planning/codebase/. Run on any new or unfamiliar project
  before planning or implementation. Refresh after significant changes.

  Usage: /ln-map-codebase [--fast [--focus tech|arch|quality|concerns]] [--refresh]
mode: subagent
---

## When to use

- Brownfield projects before planning (understand existing code first)
- After significant changes to refresh understanding
- Onboarding to an unfamiliar codebase
- Before major refactoring

Skip for greenfield projects with no code yet or trivial codebases under 5 files.

## Default mode (full map)

Spawns 4 parallel subagents. Each writes directly to `.planning/codebase/`.
Orchestrator receives confirmations only - not document contents.

| Agent | Focus | Writes |
|-------|-------|--------|
| 1 | tech | STACK.md, INTEGRATIONS.md |
| 2 | arch | ARCHITECTURE.md, STRUCTURE.md |
| 3 | quality | CONVENTIONS.md, TESTING.md |
| 4 | concerns | CONCERNS.md |

## Optional: fast mode (--fast)

Spawns 1 subagent instead of 4. Pass `--focus` to target a specific area:
- `--focus tech` - stack and integrations only
- `--focus arch` - architecture and structure only
- `--focus quality` - conventions and testing only
- `--focus concerns` - risks and concerns only

Default focus without flag: `tech+arch`

## Optional: refresh (--refresh)

Re-runs the full map and overwrites existing documents.
If `.planning/codebase/` already exists without `--refresh`, ask:
overwrite or skip?

## Process

1. Check if `.planning/codebase/` exists - prompt if so
2. Create `.planning/codebase/` if needed
3. Spawn subagents in parallel (4 full, 1 fast)
4. Wait for confirmations - do not read document contents back
5. Verify all expected documents exist with line counts
6. Report: which documents were written, any failures

## Document templates

Each agent follows this structure for their documents:

```
# <Document Title>
Generated: <date>
Focus: <agent focus area>

## Summary
<2-3 sentence overview>

## Details
<findings>

## Notes
<anything unusual or worth flagging>
```

## Success criteria

- [ ] `.planning/codebase/` created
- [ ] All expected documents written
- [ ] No agent failures
- [ ] User knows next step (typically: /ln-brainstorm or /ln-plan)

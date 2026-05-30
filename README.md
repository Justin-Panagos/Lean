# Lean

A lean, token-efficient workflow skill stack for Claude Code.
Built as a lightweight alternative to GSD and Superpowers.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/<your-username>/lean/main/install.sh | bash
```

Then run `/ln-setup` to configure.

## Why Lean

| | Superpowers | GSD Redux | Lean |
|---|---|---|---|
| Skills | 13 | 67 commands | 17 |
| Startup tokens | ~3-5k | ~5-8k | ~1,000 |
| Worst case | ~10k | ~12k | ~2,800 |
| Task classifier | ❌ | ❌ | ✅ |
| Auto-handoff hooks | ❌ | ❌ | ✅ |
| Free/structured mode | ❌ | ❌ | ✅ |
| Vibecoder Git support | ❌ | ❌ | ✅ |
| Trust/stability | ✅ | ⚠️ rug-pull | ✅ |

## Skills

| Skill | What it does |
|-------|-------------|
| /ln-setup | One-time setup wizard |
| /ln-fl-session-start | Start every session |
| /ln-config | Switch model profiles |
| /ln-map-codebase | Map existing codebase |
| /ln-codebase-explorer | Read-only code research |
| /ln-brainstorm | Design before code |
| /ln-plan | Turn spec into tasks |
| /ln-tdd | Test-driven development |
| /ln-implement | Execute a plan |
| /ln-code-review | Review against project rules |
| /ln-debug | Systematic debugging |
| /ln-spike | Validate ideas cheaply |
| /ln-handoff | Save session state |
| /ln-free-to-structured | Convert free code to structured |
| /ln-health | Diagnose project health |
| /ln-create-skill | Build custom skills |
| /ln-save-work | Save work to Git (vibecoder) |

## Workflow

```
/ln-setup (once)
↓
/ln-fl-session-start → free code or structured?
  ↓
  structured → quick / medium / hard
    quick  → ln-codebase-explorer → fix → ln-code-review
    medium → ln-codebase-explorer → ln-brainstorm → ln-plan → ln-implement → ln-code-review
    hard   → ln-codebase-explorer → ln-brainstorm → track split
               write-up → ln-notion doc
               planning → ln-plan → ln-implement → ln-code-review → ln-debug?
                          → ln-handoff or findings doc
```

## Hooks

Three hooks install automatically:

| Hook | Event | What it does |
|------|-------|-------------|
| session-start.mjs | SessionStart | Injects handoff list into context |
| context-monitor.mjs | Stop | Warns at 40%, triggers handoff at 60% |
| pre-compact.mjs | PreCompact | Emergency backup before auto-compaction |

## License

MIT

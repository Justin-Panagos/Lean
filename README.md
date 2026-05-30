# Slate

A lean, token-efficient workflow skill stack for Claude Code.
Built for solo builders and small teams who want structure without the overhead.

```bash
curl -fsSL https://raw.githubusercontent.com/<your-username>/slate/main/install.sh | bash
```

Then run `/ln-setup` to configure.

---

## Why Slate

Most AI coding workflows either do too much or nothing at all. GSD has 67 commands and 33 agents. Superpowers preloads 22k tokens before you've typed a word. Slate does the same job with 17 focused skills and under 1,000 tokens at startup.

| | Superpowers | GSD Redux | Slate |
|---|---|---|---|
| Skills / commands | 13 | 67 | 17 |
| Startup tokens | ~3-5k | ~5-8k | ~1,000 |
| Worst case full workflow | ~10k | ~12k | ~2,800 |
| Task classifier | ❌ | ❌ | ✅ |
| Auto-handoff at 60% context | ❌ | ❌ | ✅ |
| Pre-compact backup hook | ❌ | ❌ | ✅ |
| Free / structured mode | ❌ | ❌ | ✅ |
| Vibecoder Git support | ❌ | ❌ | ✅ |
| Trust / stability | ✅ stable | ⚠️ rug-pull history | ✅ you own it |

---

## How It Works

Slate is built around one core idea: **load context late, load it narrow.**

Skills only load when triggered. Subagents run in isolated context. Your main window stays clean.

The workflow has three modes depending on what you're building:

```
/ln-setup (once per project)
↓
/ln-session-start
  ├── free code   →  no gates, just build
  └── structured  →  task classifier
        ├── quick   →  explore → fix → review
        ├── medium  →  explore → design → plan → build → review
        └── hard    →  explore → design → track split
                          ├── write-up  →  Notion doc with findings + DoD
                          └── planning  →  plan → build → review → debug?
                                           → handoff or findings doc
```

**Quick** - bug fix, config change, single item. No ceremony.
**Medium** - new feature on existing code. Light design, then build.
**Hard** - new system or unknown territory. Full workflow, findings doc required before re-iterating.

---

## Skills

| Skill | Mode | What it does |
|-------|------|-------------|
| `/ln-setup` | interactive | One-time setup wizard. Configures profiles, directories, and Git mode. |
| `/ln-session-start` | interactive | Start every session. Loads config, lists handoffs, sets mode. |
| `/ln-config` | interactive | Switch between budget / balanced / quality model profiles. |
| `/ln-map-codebase` | subagent | Analyse existing codebase with parallel agents. Writes 7 documents to `.planning/codebase/`. |
| `/ln-codebase-explorer` | subagent | Read-only research. Find relevant code before making changes. |
| `/ln-brainstorm` | interactive | Design before code. Produces an approved spec before anything gets built. |
| `/ln-plan` | interactive | Convert an approved spec into executable tasks. |
| `/ln-tdd` | interactive | Test-driven development. Optional by default, enforceable with `--enforce`. |
| `/ln-implement` | subagent | Execute an approved plan. Runs in isolated context, stops on failure. |
| `/ln-code-review` | subagent | Review code against project rules. Reports MUST FIX / SHOULD FIX / SUGGESTION. |
| `/ln-debug` | subagent | Systematic debugging. Hypothesis-first, one change at a time. |
| `/ln-spike` | subagent | Validate an idea before building it. Returns VALIDATED / INVALIDATED / PARTIAL. |
| `/ln-handoff` | interactive | Save session state for resuming in a fresh context. |
| `/ln-free-to-structured` | interactive | Convert free code work into a structured starting point. |
| `/ln-health` | interactive | Diagnose planning directory and context health. |
| `/ln-create-skill` | interactive | Build custom skills on top of the base stack. |
| `/ln-save-work` | interactive | Save work to Git without knowing Git commands. Vibecoder tier only. |

---

## Hooks

Three hooks install automatically and run in the background.

| Hook | Fires on | What it does |
|------|----------|-------------|
| `session-start.mjs` | Session start | Scans `docs/handoffs/`, injects list into context |
| `context-monitor.mjs` | After each response | Warns at 40%, auto-triggers handoff at 60% |
| `pre-compact.mjs` | Before auto-compaction | Emergency backup - never lose session state |

---

## Model Profiles

Slate routes different models to different skill types to keep costs down.

| Profile | Interactive skills | Subagent skills | Use when |
|---------|-------------------|-----------------|----------|
| budget | Haiku | Haiku | Prototyping, spikes |
| balanced | Sonnet | Haiku | Default - everyday work |
| quality | Sonnet | Sonnet | Production, hard tasks |

Switch anytime with `/ln-config --profile budget`.

---

## Vibecoder vs Developer

During `/ln-setup` you'll be asked one question:

> "Are you a developer comfortable managing Git yourself?"

**No** - Slate includes `/ln-save-work`. Type it when you want to save your work. Slate handles the rest.

**Yes** - Git is yours. Slate stays out of it.

---

## Multi-Session Handoffs

Slate tracks session state across context resets.

- `/ln-handoff` saves current state to `docs/handoffs/YYYY-MM-DD-HH-MM-<topic>-handoff.md`
- On next session start, Slate lists available handoffs and asks which to resume
- Loading a handoff prints a summary: what's done, what's not, where to pick up
- `/ln-handoff --overwrite` replaces an existing handoff for the same topic

---

## Adding Your Own Skills

Slate is a base stack, not a closed system. Use `/ln-create-skill` to build project-specific skills on top without touching the core.

Custom skills go in `.claude/skills/<name>/SKILL.md` and follow the same format.

---

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/<your-username>/slate/main/install.sh | bash
```

Requires Claude Code. Install it first if needed:
```
https://docs.anthropic.com/en/docs/claude-code
```

---

## License

MIT

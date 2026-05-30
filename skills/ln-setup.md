---
name: ln-setup
description: |
  One-time setup wizard for the skill stack. Walks through configuration,
  creates profiles, and writes .planning/ln-config.json. Run once on any new
  project. Safe to re-run to update config.

  Usage: /ln-setup
mode: interactive
---

## Default config (auto-applied if user skips wizard)

```json
{
  "profile": "balanced",
  "profiles": {
    "budget":   { "interactive": "haiku",  "subagent": "haiku"  },
    "balanced": { "interactive": "sonnet", "subagent": "haiku"  },
    "quality":  { "interactive": "sonnet", "subagent": "sonnet" }
  },
  "active_profile": "balanced",
  "handoff_threshold": 60,
  "tdd": "optional",
  "session_mode": "ask",
  "created_at": "<date>"
}
```

## Wizard process

Ask each question one at a time. Allow skipping (uses default).

---

**Step 1: Project type**
> "What kind of project is this?"
- [ ] Greenfield (new project, no existing code)
- [ ] Brownfield (existing codebase)
- [ ] Solo exploration / prototyping

If brownfield → recommend running /ln-map-codebase after setup.

---

**Step 2: Default profile**
> "Which model profile do you want as default?"
- [ ] Budget — Haiku everywhere. Cheapest, fastest.
- [ ] Balanced — Sonnet for planning, Haiku for execution. *(recommended)*
- [ ] Quality — Sonnet everywhere. Best output, higher cost.

---

**Step 3: Additional profiles**
> "Do you want to set up additional named profiles to switch between?"
- [ ] Yes — walk through naming and model assignment for each
- [ ] No — use the three built-in profiles (budget / balanced / quality)

---

**Step 4: Session mode**
> "When starting a session, should the workflow mode default to:"
- [ ] Always ask (free code or structured?)
- [ ] Always structured
- [ ] Always free code

---

**Step 5: TDD preference**
> "How do you want to handle testing?"
- [ ] Optional — Claude asks each time *(recommended for beginners)*
- [ ] Always after — tests written after implementation
- [ ] Enforced — no implementation without a failing test first

---

**Step 6: Handoff threshold**
> "Auto-handoff context threshold (default 60%):"
- [ ] 50% — conservative, more handoffs
- [ ] 60% — balanced *(recommended)*
- [ ] 70% — aggressive, risk of context degradation

---

## After wizard

1. Write `.planning/ln-config.json` with chosen values
2. Create `.planning/` directory structure if missing:
   ```
   .planning/
   ├── config.json
   ├── codebase/
   ├── spikes/
   docs/
   ├── specs/
   ├── plans/
   ├── handoffs/
   └── spikes/
   ```
3. Print summary of what was configured
4. Suggest next step:
   - Brownfield → /ln-map-codebase
   - Greenfield → /ln-brainstorm or /ln-fl-session-start
   - Prototyping → /ln-spike or free code

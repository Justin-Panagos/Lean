---
name: ln-create-skill
description: |
  Build a new custom skill on top of the base stack. Walks through naming,
  trigger description, mode, and content. Saves to .claude/skills/<name>/SKILL.md.

  Usage: /ln-create-skill <what you want the skill to do>
mode: interactive
---

## Rules

- New skills extend the base stack - they don't replace or modify core skills.
- One skill per concern. If it's doing two things, split it.
- Keep under 400 lines. If it's growing, split it.
- Description must be specific enough to trigger only when intended.

## Process

1. Ask: what does this skill do and when should it trigger?
2. Ask: interactive (needs back-and-forth) or subagent (runs to completion alone)?
3. Ask: does it depend on any base skills? If so, which ones feed into it?
4. Draft the skill and show it for approval
5. On approval, save to `.claude/skills/<name>/SKILL.md`

## Template

```markdown
---
name: <skill-name>
description: |
  One paragraph. What it does and when to trigger it.
  Be specific - vague descriptions cause false triggers.

  Usage: /<skill-name> <arguments>
mode: interactive | subagent
---

## Rules

- Rule 1
- Rule 2

## Process

1. Step 1
2. Step 2

## Output

What the skill produces and where it saves it.
```

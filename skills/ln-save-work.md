---
name: ln-save-work
description: |
  Save current work to Git without needing to know Git commands.
  Stages all changes, generates a meaningful commit message from
  what was done, and commits. For vibecoders.

  Usage: /ln-save-work [optional note about what you did]
mode: interactive
tier: vibecoder
---

## Process

1. Check what changed (`git status`)
2. If nothing changed - tell the user, stop
3. Show a plain-english summary of what will be saved
4. Generate a commit message from:
   - The optional note if passed
   - Otherwise: a short description of the files changed and what they do
5. Stage all changes and commit
6. Confirm: "Work saved. X files saved with message: <message>"

## Rules

- Never force push
- Never touch branches - always commits to current branch
- If there are merge conflicts, stop and explain in plain english what happened and what to do
- Commit message must be human readable, not technical jargon

## Example commit messages

- "Added login page and fixed button styling"
- "Updated pricing section with new copy"
- "Fixed bug where form wasn't submitting correctly"

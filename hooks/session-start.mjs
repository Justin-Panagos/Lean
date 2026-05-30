#!/usr/bin/env node
/**
 * session-start.mjs
 * Fires on SessionStart. Checks for existing handoffs and injects
 * them into context so fl-session-start can list them automatically.
 * Install: .claude/hooks/session-start.mjs
 */

import { readdirSync, readFileSync, existsSync } from 'fs';
import { join } from 'path';

const handoffsDir = 'docs/handoffs';

if (!existsSync(handoffsDir)) {
  process.exit(0);
}

const files = readdirSync(handoffsDir)
  .filter(f => f.endsWith('-handoff.md'))
  .sort()
  .reverse(); // most recent first

if (files.length === 0) process.exit(0);

const list = files
  .map((f, i) => `  ${i + 1}. ${f.replace('-handoff.md', '').replace(/^\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-/, '')} (${f.substring(0, 10)})`)
  .join('\n');

// Stdout from SessionStart is injected into Claude's context
console.log(`
=== EXISTING HANDOFFS FOUND ===
${list}

Ask the user: "Pick up an existing session or start fresh?"
Load the chosen handoff and print its summary before continuing.
================================
`);

process.exit(0);

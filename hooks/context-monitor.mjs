#!/usr/bin/env node
/**
 * context-monitor.mjs
 * Fires on Stop event. Checks context usage and triggers handoff at 60%.
 * Install: .claude/hooks/context-monitor.mjs
 */

import { readFileSync } from 'fs';

const input = JSON.parse(readFileSync('/dev/stdin', 'utf8'));

// Stop hook infinite loop guard
if (input.stop_hook_active) process.exit(0);

const tokensUsed = input.context?.tokens_used ?? 0;
const tokensTotal = input.context?.tokens_total ?? 200000;
const pct = Math.round((tokensUsed / tokensTotal) * 100);

if (pct >= 60) {
  console.log(JSON.stringify({
    type: 'prompt',
    message: `⚠️  Context at ${pct}% (${tokensUsed.toLocaleString()} / ${tokensTotal.toLocaleString()} tokens). Running /handoff now to save state before continuing. Resume in a fresh session.`
  }));
  process.exit(2); // exit 2 = Claude continues (triggers handoff prompt)
}

if (pct >= 40) {
  console.log(JSON.stringify({
    type: 'notification',
    message: `Context at ${pct}% - wrap up current task cleanly before starting anything new.`
  }));
}

process.exit(0);

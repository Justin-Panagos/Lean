---
name: ln-tdd
description: |
  Test-driven development enforcement. Write a failing test before writing any
  implementation code. Use when implement is about to write new functionality.
  Skipped by default for beginners - opt in with --enforce.

  Usage: /ln-tdd <what to build> [--enforce] [--opt-out]
mode: interactive
---

## Default behaviour

TDD is recommended but not enforced by default. At the start of any
implementation Claude will ask:

> "Would you like to write tests first (TDD), or build and test after?
> TDD catches bugs earlier but adds steps. Your call."

- User chooses TDD → follow the TDD cycle below
- User chooses after → implement first, tests written at end of each task
- No response / skip → default to tests after, no blocking

## Opt-in enforcement (--enforce)

Pass `--enforce` to make TDD a hard gate. Claude will not write implementation
code until a failing test exists. No exceptions.

```
/ln-tdd --enforce <what to build>
```

## Opt-out (--opt-out)

Pass `--opt-out` to skip the question entirely and write no tests.
Use for prototypes, spikes, or throwaway code only.

## TDD cycle (when active)

```
RED   → write the smallest failing test that describes the behaviour
GREEN → write the minimum code to make the test pass
CHECK → confirm test passes before moving to next task
```

## Why this matters (for beginners)

Running and tracing failing tests is how you learn what code actually does vs
what you think it does. Skipping tests doesn't save time - it moves the
debugging cost to later when context is gone and the fix is harder.

That said - forced TDD on unfamiliar code is frustrating. Start with
tests-after and move to TDD when it feels natural.

## Rules

- Never write implementation before a test exists in --enforce mode
- Tests must fail before implementation starts (proves the test is real)
- One failing test per task - not a full test suite upfront

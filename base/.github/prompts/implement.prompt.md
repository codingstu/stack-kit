---
mode: agent
description: Implement a subtask with test-first workflow and self-verification
---

# Implement

You are implementing a specific subtask in this project.

## Context
Read these files first:
- `AGENTS.md` (especially §4 Implementation Workflow, §5 Self-Verification, §6 Testing Rules)
- `docs/architecture.md`
- `docs/commands.md`

## Workflow

Follow this order strictly:

### Step 1 — Understand
- Read the subtask description and any related spec.
- Identify which files will be changed or created.
- Confirm the change fits `docs/architecture.md` boundaries.

### Step 2 — Test First
- Write or update the test that covers the new/changed behavior.
- Run it — confirm it **fails** for the right reason (feature missing, not syntax error).

### Step 3 — Implement
- Write the **minimal** code to make the test pass.
- No speculative features. No "while I'm here" changes.
- Keep functions under 50 lines, files under 200 lines.

### Step 4 — Verify
Run the full quality gate in order:
```bash
# Replace with actual commands from docs/commands.md
lint
typecheck
test
build
```
All must pass before proceeding.

### Step 5 — Document
- Update `docs/` if behavior, API, or architecture changed.
- Add an entry to `docs/decisions.md` if a meaningful tradeoff was made.

### Step 6 — Summary
Report:
- **What changed:** files and behavior
- **How verified:** which checks passed
- **Risks:** anything that could break or needs follow-up

## Anti-Hallucination
- Do not reference files or functions without reading them first.
- Do not fabricate command output — run and report actual results.
- If a test still fails, fix it. Do not report success without evidence.

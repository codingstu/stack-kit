# CLAUDE.md

Use `AGENTS.md` as the top-level map. Everything in this file is additive to `AGENTS.md`.

## Session Start

Every non-trivial task begins with:
1. Read `AGENTS.md` (workflow rules, review checklist, anti-hallucination rules).
2. Read `docs/spec.md` (what we're building).
3. Read `docs/architecture.md` (module boundaries and testing strategy).
4. Read `docs/plan.md` (current milestone and active work).
5. Read `docs/commands.md` (exact commands to run).

## Workflow Rules

- **Think step-by-step.** Before writing code, outline the approach in your thinking.
- **Prefer minimal diffs.** Touch only what the task requires.
- **Test-first when possible.** Write or identify the test, watch it fail, then implement.
- **Self-verify every change.** Run the narrowest check, then the full quality gate (see AGENTS.md §5).
- **Update docs.** If you change behavior, API, or architecture, update the corresponding doc immediately — not "later".
- **Record decisions.** Any meaningful tradeoff goes into `docs/decisions.md` with date, context, and rationale.
- **Never guess.** If you're unsure about a file, function, API, or version, read it first. Do not fabricate.

## Context Management

- If the task involves multiple files, read all relevant files before making changes.
- After completing a task, update `docs/plan.md` to reflect current state.
- When the conversation is long, re-read the key docs before starting a new subtask to avoid context drift.
- If you notice something that contradicts the docs, flag it — don't silently work around it.

## Code Quality Expectations

- Follow the code standards in `AGENTS.md` §2 (function size, nesting, naming).
- Follow the component splitting rules in `AGENTS.md` §8.
- Use the code review checklist in `AGENTS.md` §7 before presenting any non-trivial change.
- Run the full quality gate from `docs/commands.md` after every change.

## Tool Use

Follow the tool use guidelines in `AGENTS.md` §11.

- **Web search:** Use when uncertain about library versions, API signatures, or official recommendations. Do not guess — search the official docs. Do not search for things already in the codebase.
- **MCP tools:** Use when you need real state — filesystem, git history, GitHub PRs/issues, database schema. Treat tool-returned data as ground truth. If a tool is unavailable, fall back to terminal commands.
- **MCP configuration:** See `docs/mcp.json.example` for the template. Copy to `.mcp.json` at the project root and add `.mcp.json` to `.gitignore` if it contains credentials.

## What Not to Do

- Do not duplicate guidance already captured in `docs/`.
- Do not introduce new dependencies or patterns without a decision record.
- Do not commit code that fails type-check, tests, or lint.
- Do not skip the self-verification step even if you're confident.
- Do not invent file paths, function signatures, or API responses — verify them.
- Do not use web search speculatively. Each search should have a clear question and a clear answer it needs to confirm.

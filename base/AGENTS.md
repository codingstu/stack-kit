# AGENTS.md

This repository uses a **map-first, verify-always** workflow.

---

## 1. Before You Touch Code

Read these files in order — they are the single source of truth:

1. `docs/spec.md` — what we're building and why
2. `docs/architecture.md` — module boundaries, data flow, testing strategy
3. `docs/plan.md` — current milestone, active work, what's next
4. `docs/decisions.md` — past tradeoffs and their rationale
5. `docs/commands.md` — exact commands for dev, test, lint, build

**Do not start coding until you can explain how your change fits the spec and architecture.**

---

## 2. Core Principles

### Minimal Change
- Prefer the smallest diff that satisfies the requirement.
- Offer the user explicit execution choices when scope is non-trivial: **minimal solution** or **complete solution**, then **module-by-module** or **task-by-task** execution.
- One concern per commit. If a commit message needs "and", split it.
- Preserve existing file boundaries unless there is a documented reason to refactor.

### No Silent Side-Effects
- Do not add dependencies, rename directories, change build config, or alter public APIs without updating `docs/decisions.md`.
- Do not introduce new patterns (state management, error handling, data fetching) without recording the decision.

### Code Standards
- Follow the language/framework conventions defined in the profile's `docs/architecture.md`.
- Enforce consistent naming: files, variables, functions, components, routes.
- Keep functions under 50 lines; keep files under 200 lines. If exceeded, split by responsibility.
- Use early returns over deep nesting (max 3 levels).
- Avoid generic names (`utils`, `helpers`, `common`, `shared`). Use domain-specific names.
- Prefer existing libraries over custom implementations for non-domain logic.

---

## 3. Task Splitting

Break every non-trivial task before you start coding:

1. **Decompose** — list concrete subtasks, each completable and verifiable in isolation.
2. **Order** — identify dependencies; independent subtasks can run in parallel.
3. **Size** — each subtask should produce a reviewable diff (roughly one commit).
4. **Track** — use a todo list or plan file; mark each subtask in-progress → completed.
5. **Choose execution shape** — decide with the user whether the work should advance module-by-module or task-by-task.

If a subtask grows beyond its scope, stop and re-split.

---

## 4. Implementation Workflow

For every subtask:

```
1. Read the relevant docs (spec, architecture, plan).
2. Confirm the execution choice if it affects scope: minimal vs complete, then module-by-module vs task-by-task.
3. Write or update tests FIRST when behavior changes (see §6).
4. Implement the minimal code to pass.
5. Self-verify (see §5).
6. Update docs immediately if API, behavior, architecture, or workflow expectations changed.
7. Commit the reviewed batch with a clear message: <type>(<scope>): <summary>
```

### Commit Types
`feat` · `fix` · `refactor` · `test` · `docs` · `chore` · `ci` · `style` · `perf`

---

## 5. Self-Verification (after every subtask)

Run the **narrowest check first**, then expand:

```
1. Compile / type-check the changed files.
2. Run tests covering the changed behavior.
3. Run lint + format checks on changed files.
4. Run the full quality gate from docs/commands.md.
5. Manually verify the behavior if it's UI or IO-facing.
```

**Do not mark a subtask complete until all checks pass.** If a check fails, fix it before moving on.

---

## 6. Testing Rules

- **New behavior → new test.** Changed behavior → updated test.
- Write the test before the implementation when possible (Red → Green → Refactor).
- Watch the test fail first to confirm it tests the right thing.
- Write minimal code to make the test pass — no speculative features.
- Keep tests focused: one behavior per test, clear name, no vague assertions.
- Prefer real code over mocks; use mocks only for external boundaries (network, DB, filesystem).
- Cover edge cases and error paths, not just happy paths.

---

## 7. Code Review Checklist

Before submitting any change for review:

### Correctness
- [ ] Change matches the spec or task description.
- [ ] Edge cases and error paths are handled.
- [ ] No broken existing behavior (regression).

### Quality
- [ ] Functions and files are reasonably small and focused.
- [ ] Naming is clear and domain-specific.
- [ ] No code duplication that should be extracted.
- [ ] No dead code, debug logs, or TODO hacks left behind.
- [ ] The batch size is reviewable and consistent with the chosen execution shape.

### Testing
- [ ] New/changed behavior is covered by tests.
- [ ] All tests pass (not just the new ones).
- [ ] Test names describe behavior, not implementation.

### Architecture
- [ ] Change respects module boundaries from `docs/architecture.md`.
- [ ] No business logic in UI/route entry files.
- [ ] No infrastructure concerns (DB, API calls) in domain logic.
- [ ] Dependencies flow inward (presentation → domain → infrastructure boundary).

### Documentation
- [ ] `docs/` updated immediately if API, behavior, architecture, or workflow expectations changed.
- [ ] `docs/plan.md` updated to reflect the latest completed batch.
- [ ] `docs/decisions.md` updated if a meaningful tradeoff was made.
- [ ] Public interfaces have clear types or docstrings.

### Git Discipline
- [ ] Each completed batch is ready for its own commit.
- [ ] Commits follow one concern per commit.
- [ ] Commit messages clearly describe the reviewed batch.

---

## 8. Component & Module Splitting

### When to split
- A file exceeds ~200 lines or a function exceeds ~50 lines.
- A component mixes data fetching, business logic, and rendering.
- Multiple unrelated concerns live in the same module.
- A module is imported by many unrelated consumers.

### How to split
- Extract by **responsibility**: data access, business logic, presentation, configuration.
- Keep the public API small — expose only what consumers need.
- Co-locate tightly coupled pieces; separate loosely coupled ones.
- If a piece is reusable, move it to a shared location; if it's feature-specific, keep it in the feature folder.

---

## 9. Context & Memory Management

### Staying Oriented
- **Start of session**: read `docs/spec.md`, `docs/architecture.md`, `docs/plan.md`, `docs/commands.md`.
- **Before each subtask**: re-read the relevant section if the context is stale.
- **After each completed batch**: update `docs/plan.md` (move items to done, update "Now" and "Next").

### Maintaining Continuity
- Record every meaningful decision in `docs/decisions.md` with date, context, and rationale.
- When a session ends or context resets, the next session can fully reconstruct state from `docs/`.
- Keep `docs/plan.md` as a living document — it is the coordination point between sessions.

---

## 10. Anti-Hallucination Rules

These rules prevent fabricated information from entering the codebase:

1. **Verify before asserting.** Do not claim a file exists, a function is available, or an API works unless you have read or executed it.
2. **Never invent APIs.** Check documentation or source code before using any function, method, or endpoint.
3. **Do not assume dependency versions.** Read `package.json`, `pyproject.toml`, or lock files for actual versions.
4. **When unsure, say so.** "I'm not sure — let me verify" is always better than a confident wrong answer.
5. **Show your work.** When debugging, list what you checked and what you found, not what you guessed.
6. **Test proves correctness, not confidence.** A passing test is evidence; "it should work" is not.
7. **Do not fabricate terminal output.** Run the command and report actual results.
8. **Cross-reference changes.** After editing, re-read the file to confirm the edit is correct.
9. **Use web search to verify external facts.** When a library version, API signature, or official recommendation is uncertain, search the official docs or changelog before proceeding. Do not guess.
10. **Ask before enabling external research by default.** For project work, offer explicit choices such as local-only analysis, search only when needed, or use an already configured search tool.
11. **Use MCP tools for real data.** If a tool is available (filesystem, git, GitHub, database), use it to get actual state rather than inferring from memory.

---

## 11. Tool Use Guidelines

Available tools extend what can be verified. Use them deliberately, not reflexively.

### Web Search
**Use when:**
- Verifying the current stable version of a library or framework.
- Checking whether an API, function, or CLI flag exists in the current version.
- Confirming official recommendations (e.g., Next.js App Router migration, FastAPI async patterns).
- Researching whether a known issue or breaking change exists before assuming a bug is local.

**How to present the choice:**
- Start with repository files and local docs first.
- If external facts remain uncertain, ask the user whether to stay local-only, search only when needed, or use an already configured search tool.
- Keep each search tied to a specific verification question.

**Do not use when:**
- The answer is already in the codebase (read the file instead).
- The answer is in `docs/` (read the doc instead).
- You are generating speculative research not tied to the current task.

### MCP Tools
**Use when:**
- Reading or writing files that are outside the visible context window.
- Querying a connected database or external service for real state.
- Interacting with GitHub (PRs, issues, commits) via a GitHub MCP server.
- Running git operations when the terminal is not available.

**Boundaries:**
- Never use MCP tools to bypass the quality gate (lint, typecheck, test, build).
- Do not read sensitive files (credentials, secrets) unless the task explicitly requires it.
- When an MCP tool returns data, treat it as real state — do not override with cached assumptions.
- If an MCP tool is not configured or unavailable, fall back to terminal commands.

### Tool Configuration (optional)
If your team uses Claude Code, create a `.mcp.json` at the project root to configure MCP servers.
A template is provided at `docs/mcp.json.example` after installation.
Optional search integrations may be enabled there when your team explicitly chooses them.

---

## 12. Definition of Done

A task is **done** when ALL of these are true:

- [ ] Code compiles / type-checks with zero errors.
- [ ] All tests pass (existing + new).
- [ ] Lint and format checks pass.
- [ ] Changed behavior is covered by tests.
- [ ] Docs are updated if API, behavior, architecture, or workflow expectations changed.
- [ ] `docs/plan.md` reflects the latest completed batch.
- [ ] Decisions are recorded if a meaningful tradeoff was made.
- [ ] Self-verification (§5) completed successfully.
- [ ] Work is split into reviewable batches with commit-ready boundaries.
- [ ] Final summary includes: **what changed**, **risks**, and **how it was verified**.

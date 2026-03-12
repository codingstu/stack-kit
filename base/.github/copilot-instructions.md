# Copilot Instructions

This repository uses a map-first workflow. Read `AGENTS.md` for the complete rules.

## Key Files
- `AGENTS.md` — workflow rules, code review checklist, anti-hallucination rules
- `docs/spec.md` — what we're building
- `docs/architecture.md` — module boundaries and conventions
- `docs/plan.md` — current work and next steps
- `docs/commands.md` — exact dev/test/lint/build commands
- `docs/decisions.md` — past tradeoffs

## Rules for Code Generation

1. **Read before writing.** Understand the spec and architecture before generating code.
2. **Minimal changes.** Generate only what the task requires — no speculative features.
3. **Follow existing patterns.** Match the project's naming, structure, and style conventions.
4. **Test coverage.** If generating a feature, generate or update tests alongside it.
5. **No hallucination.** Do not reference files, functions, or APIs that don't exist in the codebase. When in doubt, check first.
6. **Small functions.** Keep generated functions under 50 lines, files under 200 lines. Split by responsibility.
7. **Domain naming.** Use specific, descriptive names — avoid `utils`, `helpers`, `data`, `stuff`.
8. **Error handling.** Always handle error paths, not just happy paths.
9. **Type safety.** Prefer typed code. Use explicit types at function boundaries.
10. **Self-verify.** After changes, run the quality gate: lint → typecheck → test → build.

## Code Review
When reviewing code, use the checklist in `AGENTS.md` §7:
- Correctness, Quality, Testing, Architecture, Documentation.

# Skill Candidates

Only promote a workflow into a formal Skill after it has been repeated enough to justify the overhead. A premature Skill adds maintenance burden without saving time.

---

## Evaluation Criteria

Before promoting, confirm:
- [ ] The workflow has been executed at least 3 times manually.
- [ ] The steps are stable — they haven't changed significantly between executions.
- [ ] Automation would save meaningful time (> 5 minutes per execution).
- [ ] The inputs and outputs are well-defined and predictable.

---

## Candidate Template

```
### Skill Name

**Trigger:** When does this workflow start?
**Inputs:** What information is needed?
**Steps:**
1. ...
2. ...
3. ...
**Output:** What is produced?
**Verification:** How do you know it worked?
**Automation potential:** Script / Prompt / Manual checklist
```

---

## Universal Candidates

These are stack-agnostic workflows that apply to most projects:

### 1. feature-scaffold
- **Trigger:** New feature requested with a short spec or user story.
- **Inputs:** Feature name, spec description, target module.
- **Steps:**
  1. Create folder structure per `docs/architecture.md`.
  2. Add placeholder files (component/service/route + test + types).
  3. Register in routing / exports / index.
  4. Add skeleton test.
- **Output:** Compilable scaffold with one passing skeleton test.
- **Verification:** `typecheck` + `test` pass.

### 2. test-diagnose-repair
- **Trigger:** One or more tests are failing.
- **Inputs:** Failing test names / file paths, error output.
- **Steps:**
  1. Read the failing test and its error message.
  2. Identify root cause (regression, environment, flaky, spec change).
  3. Write a fix plan (test change, code change, or both).
  4. Apply fix.
  5. Run tests — confirm green.
  6. Run full quality gate.
- **Output:** All tests green, summary of root cause and fix.
- **Verification:** Full quality gate passes.

### 3. code-review
- **Trigger:** Before submitting a PR or after completing a task.
- **Inputs:** Diff or list of changed files.
- **Steps:**
  1. Walk through AGENTS.md §7 checklist (correctness, quality, testing, architecture, docs).
  2. Flag issues as Critical / Important / Minor.
  3. For each Critical/Important issue, provide a specific fix suggestion.
  4. Summarize: strengths, issues, overall assessment.
- **Output:** Structured review with actionable feedback.
- **Verification:** All Critical issues resolved before merge.

### 4. pr-summary
- **Trigger:** Generate PR description from a diff.
- **Inputs:** Git diff, related spec or task description.
- **Steps:**
  1. Summarize what changed and why.
  2. List affected modules / routes / APIs.
  3. Note any breaking changes or migration steps.
  4. List testing done and testing needed.
  5. Assess rollout risk (low / medium / high).
- **Output:** Markdown PR description ready to paste.
- **Verification:** Human review.

### 5. decision-record
- **Trigger:** A meaningful technical tradeoff was made.
- **Inputs:** Context, options considered, chosen option.
- **Steps:**
  1. Use the template in `docs/decisions.md`.
  2. Fill context, decision, consequences, alternatives.
  3. Add date and status.
- **Output:** New entry in `docs/decisions.md`.
- **Verification:** Entry is complete and rationale is clear.

### 6. web-search-verify
- **Trigger:** Uncertain about a library version, API signature, CLI flag, or official recommendation.
- **Inputs:** Package name / API name / topic, current assumption.
- **Steps:**
  1. Search the official docs or changelog for the relevant version.
  2. Compare with what's in `package.json` / `pyproject.toml`.
  3. If a discrepancy found: propose the correct usage.
  4. If up to date: proceed with original plan.
- **Output:** Verified fact with source URL, or corrected approach.
- **Verification:** Fact is sourced from official documentation, not from memory.
- **Automation potential:** Prompt — trigger with "verify version of X" or "check if API Y exists in version Z".

### 7. mcp-tool-use
- **Trigger:** Task requires real state from outside the visible context: filesystem listing, git history, GitHub issue/PR details, or database schema.
- **Inputs:** Task description, which MCP server to use.
- **Steps:**
  1. Confirm the relevant MCP server is configured in `.mcp.json`.
  2. Use the tool to fetch real state (do not infer from memory).
  3. Validate the returned data is relevant before acting on it.
  4. Proceed with implementation using real data.
  5. If the tool is unavailable, fall back to the terminal command from `docs/commands.md`.
- **Output:** Task completed with verified real-world state, not assumptions.
- **Verification:** The action was based on tool-returned data, not inferred.
- **Automation potential:** Prompt — trigger with "check the current state of X" or "list files in Y".

---

## Frontend Design Candidates

These candidates apply to frontend profiles only (`nextjs`, `react`, `vue`).

### 8. impeccable-frontend-design
- **Trigger:** Building or reviewing a UI page, component, or design system. Use before shipping any non-trivial UI.
- **Inputs:** Target component/page or scope (e.g., "homepage hero", "checkout form"), design goal.
- **Steps:**
  1. Define aesthetic direction (tone, constraints, differentiation) before writing code.
  2. Typography: pair distinctive fonts, use modular scale with fluid sizing (`clamp()`), vary weights for hierarchy.
  3. Color: use OKLCH/`color-mix()`, tint neutrals toward brand hue, avoid pure black/white and generic AI palette (cyan-on-dark, purple-to-blue gradients, neon accents).
  4. Layout: create spacing rhythm, embrace asymmetry, avoid card-in-card nesting, avoid identical icon-grid cards.
  5. Motion: exponential easing (`ease-out-quart/quint/expo`), animate `transform`/`opacity` only — never layout properties.
  6. Interaction: progressive disclosure, optimistic UI, empty states that teach.
  7. Run **AI Slop Test**: would someone immediately say "AI made this"? If yes, revise.
  8. Run `/audit` (a11y, performance, responsive); finish with `/polish` before shipping.
- **Output:** Visually distinctive, production-grade UI that avoids generic AI aesthetics.
- **Verification:** AI Slop Test fails (good outcome). `/audit` passes with no critical issues.
- **Automation potential:** Prompt — use Impeccable commands: `/audit`, `/critique`, `/normalize`, `/polish`, `/distill`, `/animate`, `/harden`, `/bolder`, `/quieter`.
- **Reference:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable) — 1 skill, 17 commands, curated anti-patterns. Apache 2.0.
